
#include <iostream>

#include <libexplicit/libexplicit.hpp>

auto my_explicit::say_hello( ) -> void {

  std::cout << "Hello, Explicit!" << '\x{a}';

  return void();
}

