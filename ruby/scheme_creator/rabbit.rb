require 'csv'

c = -> l {
  # if l =~ /(\d{1,2}) {2,3}(\d{1,2}) {2,3}(\d{1,2})/
  #   "[#{$1}][#{$2}][#{$3}]"
  # elsif l =~ /^Name: (.*)$/
  #   ['name', $1]
  # else
  #   l
  # end

  "[#{$1}]" if l =~ /((\d{1,2})* {2,3})/
}

c1 = -> l {
  '000 000 000' if l =~ /\d\d\d \d\d\d \d\d\d/
}

c2 = -> l {
  $1 if l =~ /^Name: (.*)$/
}

CSV.foreach 'sample3.gpl', col_sep: "\t", converters: c do |row|
  p row
end
