def calculate_stack_overflow_depth n
  calculate_stack_overflow_depth n.succ
rescue SystemStackError
  n
end
