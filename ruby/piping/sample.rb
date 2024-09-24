
# u = -> (s) { s.upcase }
# d = -> (s) { s.downcase }
# c = -> (s) { s.capitalize }

# -> (s) { s.upcase } => u
# -> (s) { s.downcase } => d
# -> (s) { s.capitalize } => c
#
# 'sample'
#   .then(&u)
#   .then(&d)
#   .then(&c) => r
#
# puts r

# puts 'sample'
#   .then { _1.upcase }
#   .then { _1.downcase }
#   .then { _1.capitalize }

-> (s) { s.capitalize } => c

['one', 'two'].map(&c) => [a, b]

puts a, b

