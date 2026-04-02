
///
/// ::: Sample 0006 :::
///

#include <algorithm>
#include <iostream>
#include <utility>
#include <vector>

namespace {

  class Sample {

    private:
      std::vector<int> data;

    public:
      Sample( ) : data { 0 } {
        std::cout << "Sample default constructor was called." << "\n";
      }

      Sample(const int n) : data { n } {
        std::cout << "Sample default constructor was called." << "\n";
      }

      Sample(const Sample & other) : data { 1, 2 } {
        std::cout << "Sample copy constructor was called." << "\n";
      }

      Sample(const Sample && other) : data { 3, 4 } {
        std::cout << "Sample move constructor was called." << "\n";
      }

      auto get_data( ) const { return data; }
  };

  auto print(Sample s) {

    auto data { s.get_data( ) };
    auto f { [ ](int e) { std::cout << e << "\n"; } };

    std::cout << "size: " << data.size( ) << "\n";
    std::cout << "capacity: " << data.capacity( ) << "\n";

    std::for_each(data.begin( ), data.end( ), f);
  }
}

auto main(int argc, char** argv, char** env) -> int {

  Sample s { 0 };

  print(s);

  print(std::move(s));

  return 0;
}

