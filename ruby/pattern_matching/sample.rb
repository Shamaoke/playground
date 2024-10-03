

=begin
n = 4

case [1, 2]
in n, *rest
  p "match n = #{n}" #=> match n = 1
else
  p "not match n = #{n}"
end
=end

=begin
n = 4

case [1, 2]
in ^n, *rest
  p "match n = #{n}"
else
  p "not match n = #{n}" #=> not match n = 4
end
=end

