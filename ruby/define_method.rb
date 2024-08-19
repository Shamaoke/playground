
module Program

  ####
  ## This is a program which demonstrates a usage of the `define_method` method.
  ##

  module_function
    def do_one   = 'module ok!'
    def do_two   = 'module ok too!'
    def do_three = 'module ok free!'

end

class Program::Sample

  one   = 'instance ok!'
  two   = 'instance ok too!'
  three = 'instance ok three!'

  define_method(:do_one)   { one }
  define_method(:do_two)   { two }
  define_method(:do_three) { three }

end

class << Program::Sample

  one   = 'ok!'
  two   = 'ok too!'
  three = 'ok three!'

  define_method(:do_one)   { one }
  define_method(:do_two)   { two }
  define_method(:do_three) { three }

end

__END__
Details:

  [Class: Module — Documentation for core (3.0.2) | Module#define_method-instance_method][∗]

  [∗]: https://rubydoc.info/stdlib/core/Module#define_method-instance_method

<!-- vim: set textwidth=80 colorcolumn=80: -->
