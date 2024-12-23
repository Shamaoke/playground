
#include <atomic>
#include <string>
#include <iostream>

struct Sample {
  Sample( ) { std::cout << "Default constructor was called!\n"; }

  Sample([[maybe_unused]] Sample& s) { std::cout << "Copy constructor was called!\n"; }

  Sample& operator = ([[maybe_unused]] const Sample& s) {

    std::cout << "Copy assignment operator was applied!\n";

    return *this;
  }
};

auto main( ) -> int {

  Sample s { };

  Sample s2 { s };

  Sample s3 { };

  s3 = s;

  // std::atomic<std::string> str1_a { "ok!" };

  // std::atomic<std::string> str2_a = str1_a;

  return 0;
}

