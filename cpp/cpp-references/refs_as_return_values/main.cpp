
///
/// ::: <title> | <subtitle> :::
///

// #include <algorithm>
// #include <cstdio>
// #include <format>
// #include <iostream>
// #include <cstdio>
#include <print>
// #include <string>
#include <vector>

std::vector v { 1, 2, 3, 4, 5 };

auto f(int n) -> int& { return v.at(n);  }

auto main(int argc, char** argv, char** env) -> int {

  auto n { 1 };

  auto m { f(n) };

  std::print("v.at(n) is {0}\n", m);

  return 0;
}

