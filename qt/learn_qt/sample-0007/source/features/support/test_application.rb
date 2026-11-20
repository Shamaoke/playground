
require 'xmlrpc/client'

class TestApplication

  def initialize
    @server_path = File.expand_path('../../../build-test/sample-0007', __dir__)
    @connection_options = { host: '127.0.0.1', port: 9000, path: '/RPC2' }
  end

  private

  def wait_until_server_ready

    ## `Process.spawn` подтверждает запуск процесса, но не готовность приложения
    ## к обработке RPC-команд. Повторяем проверку, пока сервер не начнёт
    ## принимать запросы и Spix не сможет обнаружить окно приложения.
    Process.clock_gettime(Process::CLOCK_MONOTONIC).then do |started_at|

      loop do
        begin
          break if @client.call('waitForItem', 'window', 0)
        rescue Errno::ECONNREFUSED
          ## Сервер не готов к приему сообщений.
        end

        if Process.clock_gettime(Process::CLOCK_MONOTONIC) >= (started_at + 5.0)
          raise 'Превышен интервал ожидания готовности сервера!'
        end

        sleep 0.5
      end
    end
  end

  public

  def start

    @server_pid = Process.spawn(@server_path, out: File::NULL, err: File::NULL)
    @client = XMLRPC::Client.new_from_hash(@connection_options)

    wait_until_server_ready

    ## Запросить активацию окна, чтобы оно могло получать события клавиатуры
    ## при проверке нажатия клавиш. Фокус элемента внутри окна задаётся в QML
    ## свойством `focus: true` или вызовом метода `element.forceActiveFocus( )`.
    @client.call('invokeMethod', 'window', 'requestActivate', [ ])
  end

  def stop

    return unless @server_pid

    begin
      Process.kill('TERM', @server_pid)
    rescue Errno::ESRCH
      ## Процесс приложения уже завершён.
    end

    Process.wait(@server_pid)
  end

  def click_button(path, hold: 0.1)

    @client.call('mousePress', path)

    ## Отложить выполнение следующих команд до следующего прохода Spix, давая Qt
    ## возможность обработать нажатие и обновить интерфейс. Без `wait`
    ## последующие команды могут прочитать необновленное состояние интерфейса
    ## и не учесть это событие. Здесь слово «могут» существенно: без `wait`
    ## тест не обязательно будет падать каждый раз. Результат неопределен
    ## и будет зависеть от порядка обработки команд Spix и событий Qt. `wait(0)`
    ## откладывает следующие команды до следующего прохода Spix, давая Qt
    ## возможность обработать нажатие и обновить интерфейс.
    @client.call('wait', 0)

    sleep(hold)

    @client.call('mouseRelease', path)

    ## Дать Qt возможность обработать отпускание аналогично первому вызову. Без
    ## `wait` последующие команды могут прочитать состояние интерфейса, которое
    ## ещё не учитывает это событие.
    @client.call('wait', 0)
  end

  def press_key(path, key, modifier, hold: 0.1)

    @client.call('keyPress', path, key, modifier)

    ## Дать Qt возможность обработать нажатие перед следующими командами Spix,
    ## иначе они могут прочитать ещё не обновленное состояние интерфейса.
    @client.call('wait', 0)

    sleep(hold)

    @client.call('keyRelease', path, key, modifier)

    ## Дать Qt возможность обработать отпускание клавиши перед выполнением
    ## следующих команд Spix.
    @client.call('wait', 0)
  end

  def get(path, property)
    @client.call('getStringProperty', path, property)
  end

end

