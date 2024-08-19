require 'socket'
require 'http/2'

# [ YourTransport.new, HTTP2::Client.new ] do |socket, connection|

# create TCPSocket, create HTTP2::Client then do |socket, client|

create TCPSocket as socket, create HTTP2::Client as client then do

  # connection.on :frame do |data|
  #   socket.push data

  #   push data to socket
  # end

  client on :frame do |data|
    push data to socket
  end

  loop do
    # connection.push data if socket.read => data
    # connection.push data unless socket.closed? and socket.eof?
    # connection push data unless socket closed? and socket eof?

    read data from socket

    begin
      push data to client unless socket is closed and socket is eof else break
    rescue ConnectionError as error
      write error to log
    ensure
      client close
    end
  end

end

