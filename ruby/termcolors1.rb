reds   = [ 0, 36, 72, 108, 144, 180 ]
greens = [ 0,  6, 12,  18,  24,  30 ]
blues  = [ 0,  1,  2,   3,   4,   5 ]

colors0 = [ [0,  0, 0], [36,  0, 0], [72,  0, 0], [108,  0, 0], [144,  0, 0], [180,  0, 0] ]

colors1 = [ [0,  6, 0], [36,  6, 0], [72,  6, 0], [108,  6, 0], [144,  6, 0], [180,  6, 0] ]

colors2 = [ [0, 12, 0], [36, 12, 0], [72, 12, 0], [108, 12, 0], [144, 12, 0], [180, 12, 0] ]

colors3 = [ [0, 18, 0], [0, 18, 1], [0, 18, 2], [0, 18, 3], [0, 18, 4], [0, 18, 5] ]

colors4 = [ [0, 24, 0], [0, 24, 1], [0, 24, 2], [0, 24, 3], [0, 24, 4], [0, 24, 5] ]

colors5 = [ [0, 30, 0], [0, 30, 1], [0, 30, 2], [0, 30, 3], [0, 30, 4], [0, 30, 5] ]

# colors0.each do |c| print "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(#{c[0]}, #{c[1]}, #{c[2]})  \x1b\x5b0\x6d" end
# colors1.each do |c| print "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(#{c[0]}, #{c[1]}, #{c[2]})  \x1b\x5b0\x6d" end
# colors2.each do |c| print "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(#{c[0]}, #{c[1]}, #{c[2]})  \x1b\x5b0\x6d" end
# colors3.each do |c| print "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(#{c[0]}, #{c[1]}, #{c[2]})  \x1b\x5b0\x6d" end
# colors4.each do |c| print "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(#{c[0]}, #{c[1]}, #{c[2]})  \x1b\x5b0\x6d" end
# colors5.each do |c| print "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(#{c[0]}, #{c[1]}, #{c[2]})  \x1b\x5b0\x6d" end

cube1 = [ colors0,
          colors1,
          colors2,
          colors3,
          colors4,
          colors5 ]

# cube1.each do |row|
#   row.each do |c| print "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(#{c[0]}, #{c[1]}, #{c[2]})  \x1b\x5b0\x6d" end
#   puts
# end

cube1.each do |row|
  row.each do |c| printf "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(%3<r>d, %3<g>d, %3<b>d)  \x1b\x5b0\x6d", :r => c[0], :g => c[1], :b => c[2] end
  puts
end

cube1.each do |row|
  row.each do |c| printf "|%3<r>d, %3<g>d, %3<b>d|", :r => c[0], :g => c[1], :b => c[2] end
  puts
end

# colors.each do |c| print "\x1b\x5b48;2;#{c[0]};#{c[1]};#{c[2]}\x6d  rgb(#{c[0]}, #{c[1]}, #{c[2]})  \x1b\x5b0\x6d" end

# puts "\x1b\x5b48;2;#{reds[0]};#{greens[5]};#{blues[0]}\x6dok\x1b\x5b0\x6d"
