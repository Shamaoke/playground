
###
# [ruby - Hash: no implicit conversion of String into Integer - Stack Overflow](https://stackoverflow.com/questions/74020799/hash-no-implicit-conversion-of-string-into-integer)
#
# What are you trying to do?
# What happens?
# Why this happens?
# What can be done?
#

require 'csv'

# CSV.parse(File.open('cars.csv', 'r'), headers: :first_row)['make']

# CSV.parse(DATA.read, headers: :first_row).map(&:to_h)

# CSV.open(File.open(DATA), headers: :first_row).map(&:to_h)

module ArrayRefinement
  refine Array do
    def [](name) = self.map { |e| e[name] }
  end
end

#
# eval <<~RUBY
#   using ArrayRefinement
#   @result = CSV.open('assets/cars.csv', headers: :first_row).map(&:to_h)['model']
# RUBY
#

using ArrayRefinement

# @data = File.read(__FILE__).slice(/(?<=^__END__$)\n(.*)\n/m, 1)

# @result = CSV.parse(@data, headers: :first_row)
#

#
# class Symbol
#   def to_int
#     case  self
#     when :first  then  0
#     when :second then  1
#     when :third  then  2
#     when :last   then -1
#     else  self
#     end
#   end
# end
#

#
# module SymbolRefinements
#   refine Symbol do
#     def to_int
#       case  self
#       when :first  then  0
#       when :second then  1
#       when :third  then  2
#       when :last   then -1
#       else  self
#       end
#     end
#   end
# end
#
# using SymbolRefinements
#

# @result = CSV.open('assets/cars.csv', headers: :first_row).map(&:to_h)[:second]

__END__
make,model,color,doors
dodge,charger,black,4
ford,focus,blue,5
nissan,350z,black,2
mazda,miata,white,2
honda,civid,brown,4
corvette,stingray,red,2
ford,fiesta,blue,5

