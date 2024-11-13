
=begin

END { do_work }

def do_work = (
  puts 'ok!'
  puts 'ok too!'
  puts 'ok free!'
)

=end

=begin
END { p index_a, index_b }

def index_a = nil
def index_b = ( )
=end

=begin
END { index }

    def index = (
      1 + 1
      2 + 2
      3 + 3
    )
=end

=begin
END { index }

def do_one(val) = val

def index = do_one('ok!').then { puts _1 }
=end

flag = false

value = begin
  flag and 'ok!' or 'fail!'
end

puts value

