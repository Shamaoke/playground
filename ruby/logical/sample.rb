
=begin
Example of using `and` and `or` operators a a replacement for the ternary
operator (`<conditiion> ? <true expresion> : <false expresion>`)
=end

=begin
condition = true

['ok!', 'fail!'] => [a, b]

puts (condition and a or b)

condition = false

puts (condition and a or b)
=end

=begin

=end

condition_1 = false
condition_2 = false

['ok!', 'ok too!', 'ok free!'] => [one, two, three]

puts (condition_1 and (condition_2 and one or two) or three)

