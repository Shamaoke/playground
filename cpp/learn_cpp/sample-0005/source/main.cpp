
#include <format>
#include <memory>
#include <print>

#include "include/lib.hpp"

auto main( ) -> int {

  using namespace my;

  auto c { std::make_unique<Child>(88) };

  std::println("n = {0}\nm = {1}", c->get_n( ), c->get_m( ));

  return 0;
}
