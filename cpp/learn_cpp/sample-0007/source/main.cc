
///
/// ::: Sample 0007 :::
///

#include <iostream>

auto main(int argc, char** argv, char** env) -> int {

  double * n { new double { 33.3 } };

  std::cout << "n1: " << n << "\n"; //~> 0x7c1ff6be0010
  std::cout << "*n1: " << *n << "\n"; //~> 33.3

  delete n;

  std::cout << "n2: " << n << "\n"; //~> 0x7c1ff6be0010

  // if (n) std::cout << "*n2: " << *n << "\n"; //~> ERROR: AddressSanitizer: heap-use-after-free on address 0x7c1ff6be0010

  n = nullptr;

  std::cout << "n3: " << n << "\n"; //~> 0

  if (n) std::cout << "*n3: " << *n << "\n"; //~> Code is not reachable, since `if (n) -> false`.

  return 0;
}

