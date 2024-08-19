module Comprehension
  def g
    _f = -> a {
         -> n { n > 4 ? a
                      : _f.( [*a, n * 40 + 95] ).(n + 1) } }

    _f.([0].freeze).(0.freeze)
  end

  def h
    _f = -> a {
         -> b {
         -> c {
         -> r { (a.empty? and b.empty? and c.empty?) ?
                    r :
                      _f.(a[1..-1]).(b[1..-1]).(c[1..-1]).([*r, [a[0], b[0], c[0]]])
              } } } }

    _f.(g.freeze).(g.freeze).(g.freeze).([ ].freeze)
  end

  def i
    # _f = -> r {
    #      -> a { a.empty? ? r : _f.(r + [ Swatch.new(a[0]) ]).(a[1..-1]) } }

    # or

    # _f = -> r {
    #      -> a { a.empty? ? r : _f.( r.dup << Swatch.new(a[0]) ).(a[1..-1]) } }

    # or

    _f = -> r {
         -> a { a.empty? ? r : _f.([*r, Swatch.new(a[0], a[0], a[0])]).(a[1..-1]) } }

    # _f = -> r {
    #      -> a { a.empty? ? r
    #                      : _f.([ *r, Swatch.new(a[0], a[0], a[0]) ]).(a[1..-1)
    # } }

    _f.([ ].freeze).(h.freeze)
  end

# let rec _f r a = match a with
#   | [ ]     -> r
#   |  h :: t -> _f (Swatch.new(h) :: r) t

  module_function :g, :h
end

class Swatch
  def initialize red, green, blue
    @red   = red
    @green = green
    @blue  = blue
  end

  def to_s
    "\x1b\x5b38;5;237;48;2;#{@red};#{@green};#{@blue}\x6d #{@red}#{@green}#{@blue} \x1b\x5b0\x6d"
  end
end
