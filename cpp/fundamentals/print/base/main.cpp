
///
/// ::: Print | Base :::
///

// #include <algorithm>
#include <cstdio>
// #include <format>
// #include <iostream>
#include <print>
// #include <string>
// #include <vector>

#include "person.hpp"

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

auto main(int argc, char** argv, char** env) -> int {

  using namespace std::string_literals;

  auto person { Person { "Pavel"s, "Alekhin"s } };

  std::println(stderr, "{0:*^21}", person.get_full_name());

  return 0;
}

