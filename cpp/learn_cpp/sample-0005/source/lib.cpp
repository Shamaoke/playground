
#include "include/lib.hpp"

namespace my {
  Parent::Parent( ) {}

  Parent::Parent(int n) { this->n = n; }

  auto Parent::get_n( ) -> decltype(this->n) { return this->n; }

  // Child::Child( ) : Parent { } {}

  Child::Child(int n) : Parent { n } {}

  auto Child::get_m( ) -> decltype(this->m) { return this->m; }
} // namespace my
