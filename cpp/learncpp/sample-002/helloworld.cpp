
#include <iostream>
#include <format>

#define SUCCESS 0

namespace Color {

  auto green(std::string str) -> decltype(str) {
    return std::format("\x{1b}\x{5b}\x{33}\x{32}\x{6d}{0}\x{1b}\x{5b}\x{30}\x{6d}", str);
  }

};

auto main( ) -> decltype(SUCCESS) {

  using namespace Color;

  std::cout << green("Hello, world!") << "\n";

  return SUCCESS;
}

