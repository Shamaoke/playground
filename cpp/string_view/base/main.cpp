
///
/// ::: <title> | <subtitle> :::
///

// #include <algorithm>
#include <array>
#include <format>
#include <iostream>
#include <print>
// #include <string>
// #include <vector>
#include <utility>

namespace {
}

auto main(int argc, char** argv, char** env) -> int {

  std::string_view sv { "one" };

  std::string_view sv2 { std::format("{0} two", sv) };

  std::string_view sv3 { std::format("{0} three", sv2) };

  std::println("{0}", sv3);

  return 0;
}

