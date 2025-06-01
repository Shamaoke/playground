
#include <print>

// #include <iostream>

// struct Sample {
//
//   Sample( ) { std::cout << "Default constructor was called!\n"; }
//
//   Sample([[maybe_unused]] Sample& s) { std::cout << "Copy constructor was called!\n"; }
//
//   Sample& operator = ([[maybe_unused]] const Sample& s) {
//
//     std::cout << "Copy assignment operator was applied!\n";
//
//     return *this;
//   }
// };

namespace {

  class Sample {

    public:
      auto f( ) && -> int {

        std::println("ok!");

        return 0;
      }

      auto g( ) & -> int {

        std::println("ok too!");

        return 0;
      }
  };

}

auto main( ) -> int {

  ///
  /// Sample s { };
  /// Sample& r { s };
  ///
  /// s.g(); //~> ok too!
  /// r.g(); //~> ok too!
  ///

  ///
  /// Sample { }.g();
  /// error: 'this' argument to member function 'g' is an rvalue, but function has non-const lvalue ref-qualifier
  ///    44 |   Sample { }.g();
  ///       |   ^
  /// main.cpp:32:12: note: 'g' declared here
  ///    32 |       auto g( ) & -> int {
  ///       |            ^
  ///

  /// Sample { }.f(); //~> ok!

  ///
  /// Sample s { };
  ///
  /// s.f();
  ///
  /// error: 'this' argument to member function 'f' is an lvalue, but function has rvalue ref-qualifier
  ///    41 |   s.f();
  ///       |   ^
  /// note: 'f' declared here
  ///    25 |       auto f( ) && -> int {
  ///       |            ^
  ///

  // Sample s { };

  // Sample s2 { s };

  // Sample s3 { };

  // s3 = s;

  return 0;
}

