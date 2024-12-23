
#include <iostream>
#include <string>
#include <format>

namespace esc {
  auto csi( ) -> std::string { return "\x{1b}\x{5b}"; }
  auto bkg(std::string color) -> std::string { return std::format("\x{34}\x{38}\x{3b}\x{35}\x{3b}{0}", color); }
  auto clear( ) -> std::string { return "\x{1b}\x{5b}\x{30}"; }
  auto final_byte( ) -> std::string { return "\x{6d}"; }
}

namespace colors {
  auto orange( ) -> std::string { return "\x{32}\x{30}\x{32}"; }
}

auto main( ) -> int {

  // std::string tag { std::format("\x1b\x5b\x34\x38\x3b\x35\x3b\x32\x30\x32\x6d{0}\x1b\x5b\x30\x6d", " ACTION ") };
  // std::string tag { "\x{1b}\x{5b}\x{34}\x{38}\x{3b}\x{35}\x{3b}\x{32}\x{30}\x{32}\x{6d}\x{20}ACTION\x{20}\x{1b}\x{5b}\x{30}\x{6d}" };

  std::string tag {
    std::format(
      "{0}{2}{4}{1}{3}{4}",
      esc::csi(),
      " ACTION ",
      esc::bkg(colors::orange()),
      esc::clear(),
      esc::final_byte()
    )
  };

  std::string msg { std::format("\x1b\x5b\x33\x34\x6d{0}\x1b\x5b\x30\x6d", "忍者走れ！") };

  std::cout << tag << "\x20" << msg << "\xa";

  return 0;
}

