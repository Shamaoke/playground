
///
/// ::: <title> | <subtitle> :::
///

// #include <algorithm>
// #include <format>
#include <iostream>
#include <string>
// #include <vector>

#include <libexplicit/libexplicit.hpp>

auto main(int argc, char** argv, char** env) -> int {

  using namespace std::string_literals;
  using namespace my_explicit;

  // SampleTwo sample_two { "Hello from SampleTwo!"s };
  //
  // std::string data { static_cast<std::string>(sample_two) }; //~> OK!
  //
  // std::cout << data << '\x{a}';

  // print_data<SampleTwo>(static_cast<SampleTwo>("Hello from SampleTwo!"s)); //~> OK!

  // print_data<SampleTwo>((SampleTwo) "Hello from SampleTwo!"s); //~> OK!

  // print_data<SampleOne>("Hello from SampleOne!"s); //~> OK!

  // print_data(SampleTwo { "Hello from SampleTwo!"s }); //~> OK!

  /// print_data<SampleTwo>("Hello from SampleTwo!"s); //~> ERROR!
  ///
  /// error: no matching function for call to 'print_data'
  ///   print_data<SampleTwo>("Hello from SampleTwo!"s);
  ///   ^~~~~~~~~~~~~~~~~~~~~
  ///
  /// note: candidate function template not viable: no known conversion from 'basic_string<char>' to 'SampleTwo' for 1st argument
  ///   auto print_data(T sample) -> void {
  ///        ^          ~~~~~~~~
  ///

  // SampleOne sample_one { "Hello from SampleOne!"s };
  // print_data(sample_one);

  // SampleOne sample_one { "Hello from SampleOne!"s };
  // std::cout << sample_one.get_data( ) << '\x{a}';

  // SampleTwo sample_two { "Hello from SampleTwo!"s };
  // std::cout << sample_two.get_data( ) << '\x{a}';

  // SampleOne sample_one = "Hello from SampleOne!"s;
  // std::cout << sample_one.get_data( ) << '\x{a}';

  /// SampleTwo sample_two = "Hello from SampleTwo!"s;
  /// std::cout << sample_two.get_data( ) << '\x{a}';
  ///
  /// error: no viable conversion from 'basic_string<char>' to 'SampleTwo'
  ///   SampleTwo sample_two = "Hello from SampleTwo!"s;
  ///             ^            ~~~~~~~~~~~~~~~~~~~~~~~~
  ///
  /// note: explicit constructor is not a candidate
  ///   explicit SampleTwo(std::string data);
  ///            ^
  ///

  return 0;
}

