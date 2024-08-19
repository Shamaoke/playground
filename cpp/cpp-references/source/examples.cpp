
///
/// ::: A | Implementation :::
///

#include "examples.hpp"

namespace examples {

  auto a_1( ) -> void {
    int n = 1;

    int &r1_n = n;
    int &r2_n = n;

    std::cout << "n: " << n << "\n" \
              << "r1_n: " << r1_n << "\n" \
              << "r2_n: " << r2_n << "\n";

    r1_n = 2;

    std::cout << "n: " << n << "\n" \
              << "r1_n: " << r1_n << "\n" \
              << "r2_n: " << r2_n << "\n";

    return void();
  }

  auto a_2( ) -> void {
    // auto square_val = [ ](int n) -> int { n = n * n; return n; };
    auto square_val = [ ](int n) -> int { return (n = n * n, n); };
    auto square_ref = [ ](int& n) { n = n * n; return n; };

    int n = 2;

    std::cout << "By value:" << "\n";
    std::cout << "---------" << "\n";
    std::cout << "n: " << n << "\n"; //=> 2
    std::cout << "2²: " << square_val(n) << "\n"; //=> 4
    std::cout << "n: " << n << "\n"; //=> 2
    std::cout << "\n";

    n = 2;

    std::cout << "By reference:" << "\n";
    std::cout << "-------------" << "\n";
    std::cout << "n: " << n << "\n"; //=> 2
    std::cout << "2²: " << square_ref(n) << "\n"; //=> 4
    std::cout << "n: " << n << "\n"; //=> 4

    return void();
  }
}

