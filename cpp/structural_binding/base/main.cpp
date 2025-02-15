
///
/// ::: <title> | <subtitle> :::
///

// #include <algorithm>
#include <array>
// #include <format>
#include <iostream>
#include <print>
// #include <string>
// #include <vector>

namespace {
  class Person {
    private:
      std::string name { "" };

    public:
      Person(std::string name) : name { name } { }

      auto get_name( ) const -> std::string { return this->name; }
  };

  template<std::size_t N>
  using People = std::array<Person, N>;
}

/// template<std::size_t N>
/// using Names = std::array<std::string, N>;

auto main(int argc, char** argv, char** env) -> int {

  /// The same as People<4> people
  const People people {
    Person { "Alice" },
    Person { "Bob" },
    Person { "Christina" },
    Person { "Dave" },
  };

  const auto& [ alice, bob, chris, dave ] = people;

  /// Names names {
  ///   alice.get_name(),
  ///   bob.get_name(),
  ///   chris.get_name(),
  ///   dave.get_name(),
  /// };
  ///
  /// It won't compile. It needs to implement a user formatter. Discover how to do that.
  /// std::cout
  ///   << std::format("{0}\x{a}{1}\x{a}{2}\x{a}{3}", names)
  ///   << std::endl;

  // std::cout
  //   << std::format("{0}\x{a}{1}\x{a}{2}\x{a}{3}", alice.get_name(), bob.get_name(), chris.get_name(), dave.get_name())
  //   << std::endl;

  std::println(
    "{0}\x{a}{1}\x{a}{2}\x{a}{3}",
    alice.get_name(),
    bob.get_name(),
    chris.get_name(),
    dave.get_name()
  );

  return 0;
}

