##
## ::: Breakdance :::
##

##
## run with `ruby -I . -r breakdance -e 'Break.start!'
##

module Break
  def dance i = 10
    unless i.eql? 0
     sleep 1
     puts i
     dance(i - 1)
    end
  end

  def start!
    puts "\x1b\x5b38;5;2\x6dStart!\x1b\x5b0\x6d"
    dance
    puts "\x1b\x5b38;5;2\x6dDone!\x1b\x5b0\x6d"
  end

  module_function :dance, :start!
end

