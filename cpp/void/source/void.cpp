
///
/// ::: Void :::
///

#include <iostream>

// auto do_one( ) -> void {
//
//   std::cout << "ok!" << "\n";
//
//   // `return void { };` doesn't work
//   return void();
// }

class Sample {

  private:
    std::string one { };

  public:
    Sample( ) {
      this->one = "ok!";
    }

    auto get_one( ) -> decltype(this->one) { return this->one; }
};

auto get_sample( ) -> Sample { return Sample { }; }

auto main([[maybe_unused]] int argc, [[maybe_unused]] char* argv[ ], [[maybe_unused]] char* env[ ]) -> int {

  // do_one();

  std::cout << get_sample().get_one() << "\n";

  return 0;
}

