
#include <iostream>
#include <string>
#include <format>

auto main( ) -> int {

  std::string tag { std::format("\x1b\x5b\x34\x38\x3b\x35\x3b\x32\x30\x32\x6d{0}\x1b\x5b\x30\x6d", " ACTION ") };
  std::string msg { std::format("\x1b\x5b\x33\x34\x6d{0}\x1b\x5b\x30\x6d", "忍者走れ！") };

  std::cout << tag << "\x20" << msg << "\xa";

  return 0;
}

