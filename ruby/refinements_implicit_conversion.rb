
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
#
# using SymbolRefinements
#
# @result = [:foo, :bar, :baz][:second]
#

