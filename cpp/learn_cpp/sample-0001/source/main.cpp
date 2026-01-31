
#include <format>
#include <iostream>

class Sample {

  public:
    Sample( ) {
      std::cout << std::format("Sample was created!\n");
    }

    ~Sample( ) {
      std::cout << std::format("Sample was dropped!\n");
    }
};

auto main( ) -> int {

  auto s { new Sample { } };

  delete s;

  return 0;
}

