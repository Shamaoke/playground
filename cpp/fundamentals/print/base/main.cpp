
///
/// ::: Print | Base :::
///

// #include <algorithm>
#include <cstdio>
#include <format>
// #include <iostream>
#include <print>
// #include <string>
#include <string_view>
// #include <vector>

///
/// Details:
/// --------
///
/// • [Standard library header <cstdio> - cppreference.com](https://en.cppreference.com/w/cpp/header/cstdio)
///
/// • [Standard library header <print> (C++23) - cppreference.com](https://en.cppreference.com/w/cpp/header/print)
///
/// • [Standard format specification (since C++20) - cppreference.com](https://en.cppreference.com/w/cpp/utility/format/spec)
///
/// • [std::literals::string_literals::operator""s - cppreference.com](https://en.cppreference.com/w/cpp/string/basic_string/operator""s)
///

namespace {

  class Person {

    private:
      const std::string_view name { };
      const std::string_view surname { };

    public:
      Person(const std::string_view name, const std::string_view surname) :
        name { name },
        surname { surname }
      { }

      auto get_full_name( ) const -> std::string {
        return std::format("{0} {1}", this->name, this->surname);
      }
  };
}

auto main(int argc, char** argv, char** env) -> int {

  // using namespace std::string_literals;
  using namespace std::string_view_literals;

  const auto person { Person { "Pavel"sv, "Alekhin"sv } };

  std::println(stderr, "{0:*^21}", person.get_full_name());

  return 0;
}

