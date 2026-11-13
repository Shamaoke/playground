
Step "приложение запущено" do

  server_path = File.expand_path('../../../build/sample-0007', __dir__)

  @server_pid = Process.spawn(server_path, err: File::NULL, out: File::NULL)

  @client = XMLRPC::Client.new_from_hash(host: '127.0.0.1', port: 9000, path: '/RPC2')

  deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 5.0

  loop do
    begin
      break if @client.call('waitForItem', 'window/main/button', 0)
    rescue Errno::ECONNREFUSED
      ## Сервер не готов к приему сообщений.
    end

    if Process.clock_gettime(Process::CLOCK_MONOTONIC) >= deadline
      raise 'Превышен интервал ожидания готовности сервера!'
    end

    sleep 0.5
  end

  @client.call('invokeMethod', 'window', 'requestActivate', [ ])
end

Step "я кликаю по кнопке" do

  @client.call('mousePress', 'window/main/button')
  @client.call('wait', 0)

  sleep(0.1)

  @client.call('mouseRelease', 'window/main/button')
  @client.call('wait', 0)
end

Step "я нажимаю пробел на кнопке" do

  @client.call('keyPress', 'window/main/button', 0x20, 0)
  @client.call('wait', 0)

  sleep(0.1)

  @client.call('keyRelease', 'window/main/button', 0x20, 0)
  @client.call('wait', 0)
end

Step "статус равен {string}" do |expected|

  actual = @client.call('getStringProperty', 'window/main', 'status')

  expect(actual).to(eq(expected))
end

