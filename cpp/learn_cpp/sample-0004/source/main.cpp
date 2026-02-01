
#include <format>
#include <print>
#include <iostream>
#include <memory>


class Sample {

  private:
    int n { 98 };
    int m { 99 };

  public:
    Sample( ) {
      std::cout << std::format("Sample was created!\n");
    }

    ~Sample( ) {
      std::cout << std::format("Sample was dropped!\n");
    }

    auto get_n( ) -> int { return n; }
    auto get_m( ) -> int { return m; }
};

namespace my {

  auto take_copy(Sample s) {
    std::println("n = {0}", s.get_n());
  }

  // auto take_move_copy(auto s) {
  //   std::println("n = {0}", s->get_n());
  // }
  // or
  auto take_move_copy(std::unique_ptr<Sample> s) {
    std::println("n = {0}", s->get_n());
  }
}

auto main( ) -> int {

  // auto s { std::make_unique<Sample>() };
  //
  // auto r { std::move(s) };
  //
  // std::println("n + m = {0}", r->get_n() + r->get_m());
  //
  // std::println("n = {0}", s->get_n()); //=> `Program received signal SIGSEGV, Segmentation fault.` at runtime

  // auto s { Sample { } };
  //
  // my::take_copy(s);
  //
  // std::println("n = {0}", s.get_n());

  // auto s { std::make_unique<Sample>() };
  //
  // my::take_move_copy(std::move(s));
  //
  // std::println("n = {0}", s->get_n()); // `Program received signal SIGSEGV, Segmentation fault.` at runtime

  return 0;
}

