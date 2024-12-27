
///
/// ::: MainFunction | Env :::
///

// #include <algorithm>
// #include <format>
#include <iostream>
// #include <string>
// #include <vector>

auto main(int argc, char** argv, char** env) -> int {

  char env_1[ ] { "PLAYGROUND_DIR=/home/user/.workspace/playground" };
  char env_2[ ] { "WORKSPACE_DIR=/home/user/.workspace" };
  char env_3[ ] { 'C', 'O', 'L', 'O', 'R', '=', 'V', 'E', 'R', 'M', 'I', 'L', 'I', 'O', 'N', '\x{0}' };

  char* mem[ ] { &*env_1, &*env_2, &*env_3, nullptr };

  char** env_0 { &*mem };

  std::cout
    << "env_1: " << env_1
    << " -> " << typeid(env_1).name()
    << '\x{a}'; //~> A48_c

  std::cout
    << "env_2: " << env_2
    << " -> " << typeid(env_2).name()
    << '\x{a}'; //~> A36_c

  std::cout
    << "env_3: " << env_3
    << " -> " << typeid(env_3).name()
    << '\x{a}'; //~> A16_c

  std::cout
    << "mem: " << mem
    << " -> " << typeid(mem).name()
    << '\x{a}'; //~> A3_Pc

  std::cout
    << "*mem: " << *mem
    << " -> " << typeid(*mem).name()
    << '\x{a}'; //~> Pc

  std::cout
    << "env_0: " << env_0
    << " -> " << typeid(env_0).name()
    << '\x{a}'; //~> PPc

  std::cout
    << "*env_0: " << *env_0
    << " -> " << typeid(*env_0).name()
    << '\x{a}'; //~> Pc

  std::cout
    << "env_01: " << env_01
    << " -> " << typeid(env_01).name()
    << '\x{a}'; //~> PPc

  std::cout
    << "*env_01: " << *env_01
    << " -> " << typeid(*env_01).name()
    << '\x{a}'; //~> Pc

  while (*env_0++) std::cout << *env_0 << '\x{a}';

  return 0;
}

