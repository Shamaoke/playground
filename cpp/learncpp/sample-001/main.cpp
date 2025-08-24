
#include <format>
#include <print>

// #include <unistd.h>
%:include <unistd.h>
/// Details about the `%:` syntax:
/// [Alternative operator representations - cppreference.com](https://en.cppreference.com/w/cpp/language/operator_alternative.html#Alternative_tokens)

// #include <memory>
// #include <vector>
// #include <array>

// #define SUCCESS 0

// namespace Status {
//
//   constexpr auto SUCCESS( ) -> int { return 0; }
//
//   constexpr auto FAIL( ) -> int { return 0; }
//
// }

enum class Status {
  SUCCESS,
  FAIL,
};

namespace Color {

  auto green(std::string str) -> decltype(str) {
    return std::format("\x{1b}\x{5b}\x{33}\x{32}\x{6d}{0}\x{1b}\x{5b}\x{30}\x{6d}", str);
  }

  auto yellow(std::string str) -> decltype(str) {
    return std::format("\x{1b}\x{5b}\x{33}\x{33}\x{6d}{0}\x{1b}\x{5b}\x{30}\x{6d}", str);
  }

};

// auto main( ) -> decltype(static_cast<int>(Status::SUCCESS)) {
auto main( ) -> int {

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

  // auto build_configuration { "" };

  auto build_configuration <% "" %>;
  /// Details about the `<% %>` syntax:
  /// [Alternative operator representations - cppreference.com](https://en.cppreference.com/w/cpp/language/operator_alternative.html#Alternative_tokens)

/// Use `-DDEBUG` or `-DRELEASE` compiler options to set the implicit definition
/// that will be read before preprocessing the source file.
#ifdef DEBUG
  build_configuration = "DEBUG";
#elif RELEASE
  build_configuration = "RELEASE";
#else
  build_configuration = "UNDEFINED";
#endif

  std::println("build_configuration = {0}", build_configuration);

  auto result { static_cast<int>(Status::SUCCESS) };

  return result;
}

