# f = -> n { n * 40 + 95 }
# g = -> n { n * 10 + 85 }
# h = -> n { n * 50 + 10 }

# l = f

swatch_rgb   = -> r, g, b, text { "\x1b\x5b38;5;237;48;2;#{r};#{g};#{b}\x6d#{text}\x1b\x5b0\x6d" }
swatch_color = -> c, text { "\x1b\x5b38;5;237;48;5;#{c}\x6d#{text}\x1b\x5b0\x6d" }

# arr = Array.new(5, &l).unshift(0)
# arr = (0...5).map { |n| n * 40 + 95 }
# arr = (0...5).inject([0]) { |a, n| a << n * 40 + 95 }
# arr = (_f = -> a { -> n { n > 5 ? a : _f.([ *a, n * 40 + 95 ]).(n.succ) } }).([0]).(0)

# base = [0, 95, 135, 175, 215, 255]

reds   = [0, 51, 127, 180, 218, 231]
greens = [0, 51, 127, 180, 218, 231]
blues  = [0, 51, 127, 180, 218, 231]

reds.each_with_index do |r, i|
  greens.each_with_index do |g, j|
    blues.each_with_index do |b, k|
      c = 16 + (i * 36) + (j * 6) + k
      options = { :r => r, :g => g, :b => b, :c => c }
      printf swatch_color.(c, " %<c>03d "), options
      printf swatch_rgb.(r, g, b, "%<r>03d:%<g>03d:%<b>03d"), options
      printf swatch_rgb.(r, g, b, " #%<r>02x%<g>02x%<b>02x "), options
      print " "
    end
    puts
  end
  puts
end
