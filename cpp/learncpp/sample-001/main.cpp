
#include <format>
#include <print>
#include <unistd.h>
// #include <memory>
// #include <vector>
// #include <array>

#define SUCCESS 0

namespace Color {

  auto green(std::string str) -> decltype(str) {
    return std::format("\x{1b}\x{5b}\x{33}\x{32}\x{6d}{0}\x{1b}\x{5b}\x{30}\x{6d}", str);
  }

  auto yellow(std::string str) -> decltype(str) {
    return std::format("\x{1b}\x{5b}\x{33}\x{33}\x{6d}{0}\x{1b}\x{5b}\x{30}\x{6d}", str);
  }

};

auto main( ) -> decltype(SUCCESS) {

  using namespace Color; // green(std::string)

  // auto str { "Hello, world!" };
  // auto path { std::getenv("PATH") };

  /// std::string hostname { };
  /// or
  /// char hostname[256] { };
  /// or
  /// auto hostname { new char[255] }; // then `delete[] hostname` when the object is no longer needed
  /// or
  /// auto hostname { std::make_unique<char[ ]>(256) };
  /// or
  /// std::vector<char> hostname { '\x{0}' }; // Segfault when initializing with the default value (i. e. `{ }`). Why?
  /// or
  /// std::vector<char> hostname { };
  /// hostname.reserve(256);
  /// or
  /// std::array<char, 256> hostname { };

  // gethostname(hostname, sizeof hostname);

  // std::println("{0}", green(str));
  // std::println("{0}", path);
  // std::println("{0}", yellow(hostname));

  /// delete[] hostname;

  int i { 0 };

/// Use `-DDEBUG` compiler option to set the implicit define will be read before
/// preprocessing.
#ifdef DEBUG
  i = 10;
#else
  i = 20;
#endif

  std::println("i = {0}", i);

  return SUCCESS;
}

