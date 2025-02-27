
///
///
///

#include <print>

namespace My {

  namespace Util {
    constexpr auto pred(unsigned int n) -> unsigned int { return n - 1; }
    constexpr auto multi(unsigned int n, unsigned int m) -> unsigned int { return n * m; }
  }

  template<unsigned int N>
  class Factorial {
    public:
      static const auto val { Util::multi(N, Factorial<Util::pred(N)>::val) };
  };

  template<>
  class Factorial<1> {
    public:
      static const auto val { 1 };
  };
}

auto main( ) -> int {

  constexpr auto n { My::Factorial<4>::val };
  constexpr auto m { My::Factorial<1>::val };

  std::println("n = {0}\nm = {1}", n, m);

  return 0;
}

