# Insert = -> n {
#          -> a { n < a[0] ? [a[0], n, *a]
#                 : (require 'pry'; binding.pry; Insert.(n).(a[1..-1])) } }

# Insert2 =
#   -> n {
#   -> a {
#   -> r { n <= a[0] ? [*r, n, *a]
#                    : Insert2.(n)
#                             .(a[1..-1])
#                             .([*r, a[0]]) } } }

# Insert3 =
#   -> n {
#   -> a {
#   -> r { a[0].nil? ? [*a, n]
#                    : n <= a[0] ? [*r, n, *a]
#                                : Insert3.(n)
#                                         .(a[1..-1])
#                                         .([*r, a[0]]) } } }

# Insert4 =
#   -> n {
#   -> a {
#   -> r { n > a[-1] ? [*r, *a, n]
#                    : n <= a[0] ? [*r, n, *a]
#                                : Insert4.(n)
#                                         .(a[1..-1])
#                                         .([*r, a[0]]) } } }

# Insert5 = -> n, a {
#   (_f = -> n, a, r { n > a[-1] ? [*r, *a, n]
#                                : n <= a[0] ? [*r, n, *a]
#                                : _f.(n, a[1..-1], [*r, a[0]]) }).(n, a, [ ])
# }

# Insert6 = -> n {
#           -> a { (_f = -> n, a, r { n > a[-1] ? [*r, *a, n]
#                                               : n <= a[0] ? [*r, n, *a]
#                                                           : _f.(n, a[1..-1], [*r, a[0]]) } ).(n, a, [ ]) } }

# Insert6 = -> n {
#           -> a { _f = -> n, a, r { n <= a[0] ? [*r, n, *a]
#                                              : _f.(n, a[1..-1], [*r, a[0]]) }
#
#                  _g = -> n, a, r { n > a[-1] ? [*r, *a, n]
#                                              : _f.(n, a, r) }
#
#                  _g.(n, a, [ ]) } }

Insert = -> n { -> a, r = [ ] {
    a.empty? ? [n]
  : (h, *t = a; n > a[-1]) ? [*a, n]
  : (h, *t = a; n <= h   ) ? [*r, n, *a]
  : Insert.(n).(t, [*r, h]) } }

# p Insert.(5000).((1..100000).to_a)

p Insert.(2).((1..10).to_a)

# F = Insert.(0)
# G = Insert.(5)
# H = Insert.(11)
#
# A = [ ]
# B = [2, 4, 7, 10]
#
# F.(A) #=> [0]
#
# F.(B) #=> [<0>, 2, 4, 7, 10]
# G.(B) #=> [2, 4, <5>, 7, 10]
# H.(B) #=> [2, 4, 7, 10, <11>]
