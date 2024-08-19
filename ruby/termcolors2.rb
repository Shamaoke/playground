a, b, c, d, e, f = [0, 95, 135, 175, 215, 255] # (Array.new(6) { |n| n * 40 + 95 }).unshift(0)

# a, b, c, d, e, f = [0, 20, 40, 80, 120, 140]

[a, b, c, d, e, f].each_with_index do |r, i|
  [a, b, c, d, e, f].each_with_index do |g, j|
    [a, b, c, d, e, f].each_with_index do |b, k|
      n = 16 + (i * 36) + (j * 6) + k
      options = { :r => r, :g => g, :b => b, :n => n }
      printf "\x1b\x5b38;5;237;48;5;#{n}\x6d %<n>3d \x1b\x5b0\x6d ", options
      # printf "\x1b\x5b38;5;237;48;2;#{r};#{g};#{b}\x6d rgb(%<r>3d,%<g>3d,%<b>3d) \x1b\x5b0\x6d ", options
      printf "\x1b\x5b38;5;237;48;2;#{r};#{g};#{b}\x6d #%<r>02x%<g>02x%<b>02x \x1b\x5b0\x6d ", options
    end
      print "\n"
  end
    print "\n"
end

l, m = [0, 128]

[l, m].each_with_index do |b, i|
  [l, m].each_with_index do |g, j|
    [l, m].each_with_index do |r, k|
      options = { :r => r, :g => g, :b => b }
      printf "\x1b\x5b38;5;237;48;2;#{r};#{g};#{b}\x6d #%<r>02x%<g>02x%<b>02x \x1b\x5b0\x6d ", options
    end
  end
end

print "\n"

x, y = [0, 255]

[x, y].each_with_index do |b, i|
  [x, y].each_with_index do |g, j|
    [x, y].each_with_index do |r, k|
      # n = i + j + k
      # options = { :r => r, :g => g, :b => b, :n => n }
      options = { :r => r, :g => g, :b => b }
      # printf "\x1b\x5b38;5;237;48;5;#{n}\x6d %<n>3d \x1b\x5b0\x6d ", options
      printf "\x1b\x5b38;5;237;48;2;#{r};#{g};#{b}\x6d #%<r>02x%<g>02x%<b>02x \x1b\x5b0\x6d ", options
    end
  end
end

(Array.new(24) { |n| n * 10 + 8 }).each do |c| # c = [ 8, 18, 28, 38 ... 238 ]
  printf "\x1b\x5b38;5;237;48;2;#{c};#{c};#{c}\x6d #%<c>02x%<c>02x%<c>02x \x1b\x5b0\x6d ", { :c => c }
end

# k = blue
# k = 0 > 0
# k = 1 > 95
# k = 2 > 135
# k = 3 > 175
# k = 4 > 215
# k = 5 > 255

#  0, 0, 0;  0, 0, 95;  0, 0, 135;  0, 0, 175;  0, 0, 215;  0, 0, 255
# 95, 0, 0; 95, 0, 95; 95, 0, 135; 95, 0, 175; 95, 0, 215; 95, 0, 255
