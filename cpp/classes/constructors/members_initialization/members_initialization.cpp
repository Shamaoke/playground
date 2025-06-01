
///
/// Classes | Constructors | Members initialization
///

#include <print>

#include <libmembers_initialization/libmembers_initialization.hpp>

auto main( ) -> int {

  using namespace members_initialization;

  auto person_001 { Person { "Pavel", "Alekhin" } };

  auto employee_001 { Employee { person_001, "Engineer" } };

  std::println("{0}", employee_001.get());

  return 0;
}

