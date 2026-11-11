#! /usr/bin/env ruby

require 'xmlrpc/client'

XMLRPC::Config.enable_nil_parser = true

pid = Process.spawn('./server', err: File::NULL, out: File::NULL)

client = XMLRPC::Client.new_from_hash(host: '127.0.0.1', port: 9000, path: '/RPC2')

deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 5.0

loop do
  begin
    break if client.call('waitForItem', 'window', 0)
  rescue Errno::ECONNREFUSED
    ## Сервер не готов к приему сообщений.
  end

  if Process.clock_gettime(Process::CLOCK_MONOTONIC) >= deadline
    begin
      Process.kill('TERM', pid)
    rescue Errno::ESRCH
      ## Процесс сервера уже завершен.
    end

    Process.wait(pid)

    raise 'Превышен интервал ожидания готовности сервера!'
  end

  sleep 0.5
end

client.call('invokeMethod', 'window', 'requestActivate', [ ])

status1 = client.call('getStringProperty', 'window/main', 'status')

puts "Текущий статус: #{status1}"

client.call('mouseClick', 'window/main/button')

client.call('wait', 0)

status2 = client.call('getStringProperty', 'window/main', 'status')

puts "Текущий статус: #{status2}"

client.call('enterKey', 'window/main/button', 0x20, 0)

client.call('wait', 0)

status3 = client.call('getStringProperty', 'window/main', 'status')

puts "Текущий статус: #{status3}"

client.call('quit')

Process.wait(pid)
