
#include "main.hpp"

auto main( ) -> int {

  auto d { Derived { } };

  std::cout << d.do_one() << "\n";

  return 0;
}

