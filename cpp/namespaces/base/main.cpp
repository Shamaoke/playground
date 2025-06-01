
///
/// ::: <title> | <subtitle> :::
///

// #include <algorithm>
// #include <cstdio>
// #include <format>
// #include <iostream>
#include <print>
#include <string>
// #include <vector>

namespace My {
  auto do_one( ) -> std::string;
};

auto My::do_one( ) -> std::string { return "ok!"; }

auto main(int argc, char** argv, char** env) -> int {

  std::println("{0}", My::do_one());

  return 0;
}

