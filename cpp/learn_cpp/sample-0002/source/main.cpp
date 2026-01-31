
#include <format>
#include <iostream>
#include <memory>

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

  auto s { std::make_unique<Sample>() };

  return 0;
}

