
///
/// ::: MainFunction | Env :::
///

///
/// This program was created in an attempt to understand the operation of the
/// `main` function in terms of receiving and interpreting array type arguments
/// passed to it.
///
/// As it turned out, if the argument passed to the `main` function is an array,
/// then it undergoes the so-called “decay”, i. e. decomposition to its components,
/// and is then represented in the body of the function not as an array, but as
/// a pointer to its first element. Since the array is represented in memory as
/// a contiguous sequence, it is possible to move through the elements of the
/// decomposed array by incrementaly increasing the pointer value by one.
///

#include <algorithm>
// #include <format>
#include <iostream>
// #include <string>
// #include <vector>

namespace my {

  // auto iterate(char** ary) -> void {
  /// or
  auto iterate(char* ary[ ]) -> void {

    // for (auto& e : ary) std::cout << e << '\x{a}';
    /// Won't work for decomposed arrays.
    ///
    /// With `auto iterate(char** ary) -> void` it will result with the following.
    /// ````
    /// error: invalid range expression of type 'char **'; no viable 'begin'
    /// function available
    /// ````
    ///
    /// With `auto iterate(char* ary[ ]) -> void` it will result with the following.
    /// ````
    /// error: cannot build range expression with array function parameter 'ary'
    /// since parameter with array type 'char *[]' is treated as pointer type 'char **'
    /// ````
    ///

    /// The following will compile.
    while (*ary++) std::cout << *ary << '\x{a}';

    return void();
  }

  template<int N>
  auto iterate_ref(char* (&ary)[N]) -> void {

    // for (auto& e : ary) std::cout << e << '\x{a}';
    /// or
    auto f { [ ] (auto& e) { std::cout << e << '\x{a}'; } };

    std::ranges::for_each(ary, f);

    return void();
  }
}

auto main(int argc, char** argv, char* env[ ]) -> int {

  // using A_Pc = char* [ ];
  // using PPc  = char**;
  ///
  /// Or it's better to set to these types meaningful names.
  ///
  using Mem_t = char* [ ];
  using Env_t = char**;

  char env_1[ ] { "PLAYGROUND_DIR=/home/user/.workspace/playground" };
  char env_2[ ] { "WORKSPACE_DIR=/home/user/.workspace" };
  char env_3[ ] { 'C', 'O', 'L', 'O', 'R', '=', 'V', 'E', 'R', 'M', 'I', 'L', 'I', 'O', 'N', '\x{0}' };

  // A_Pc mem { &*env_1, &*env_2, &*env_3, nullptr };
  // PPc env_0 { &*mem };
  ///
  /// The same but with meaningful type names.
  ///
  Mem_t mem { &*env_1, &*env_2, &*env_3, nullptr };
  Env_t env_0 { &*mem };

/// When building with `cmake -D CMAKE_BUILD_TYPE=Debug` the `DEBUG` variable will be set.
#ifdef DEBUG
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
#endif

  // while (*env_0++) std::cout << *env_0 << '\x{a}';
  /// or
  // for (auto& e : mem) std::cout << e << '\x{a}';
  /// but
  // for (auto& e : env) std::cout << e << '\x{a}';
  /// will result in the following error:
  /// `cannot build range expression with array function parameter 'env' since
  /// parameter with array type 'char *[]' is treated as pointer type 'char **'`
  /// however, the following does work
  // for (; *env != nullptr; env++) std::cout << *env << '\x{a}';

  // my::iterate(mem);
  // my::iterate(env_0);
  /// Both of these functions will work because in the case of an array, when it's
  /// passed as an argument to the function, it will be decomposed into its
  /// components.
  ///
  /// The following will also work, because the array is not subject to decay
  /// when passed by reference as a function argument.
  my::iterate_ref<std::size(mem)>(mem);
  /// See [Template parameters and template arguments - cppreference.com][*]
  /// for details about template arguments for functions.
  ///
  /// [*]: https://en.cppreference.com/w/cpp/language/template_parameters#Template_arguments
  ///

  /// Details
  /// -------
  /// • [c++ - Range-for-statement cannot build range expression with array function parameter - Stack Overflow](https://stackoverflow.com/questions/24105205/range-for-statement-cannot-build-range-expression-with-array-function-parameter)
  ///
  /// • [Array declaration | Array to pointer decay - cppreference.com](https://en.cppreference.com/w/cpp/language/array#Array-to-pointer_decay)
  ///
  /// • [Implicit conversions - cppreference.com](https://en.cppreference.com/w/cpp/language/implicit_conversion#Array-to-pointer_conversion)
  ///

  return 0;
}

