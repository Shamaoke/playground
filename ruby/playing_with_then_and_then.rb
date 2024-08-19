[ 'one',
  'two',
  'three',
  'four'

].then do |one, two, three, four|

  one.upcase   .then do |up_one|
  two.upcase   .then do |up_two|
  three.upcase .then do |up_three|
  four.upcase  .then do |up_four|

  [up_one, up_two, up_three, up_four].then { |a| p *a }

  end end end end

end
