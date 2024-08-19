# show the files opened by this process `watch -ctn 1 lsof\ -p\ <pid>`
# show the files opened by this command `watch -ctn 1 lsof\ -c\ ruby\ fd_close.rb`

puts Process.pid

f = File.open 'data.txt', 'w'

sleep 20

f.write "ok!\n"

f.close

sleep 20

f.write "ok too!\n" unless f.closed?
