
///
/// ::: Main :::
///

#include <string>
#include <iostream>
#include <set>

class Bagel {

  private:
    std::set<std::string> toppings { };

  public:
    Bagel(std::set<std::string> toppings) {
      this->toppings = toppings;
    }

    auto inspect( ) const -> void {

      auto f { [ ](auto e) { std::cout << e << "\n"; } };

      std::for_each(this->toppings.begin(), this->toppings.end(), f);

      return void();
    }
};

auto main([[maybe_unused]] int argc, [[maybe_unused]] char* argv[ ], [[maybe_unused]] char* env[ ]) -> int {

  using namespace std::string_literals;

  auto toppings { std::set<std::string> { } };

  toppings.insert("Salt"s);

  auto bagel_a { Bagel { toppings } };

  bagel_a.inspect();

  toppings.insert("Pepper"s);

  auto bagel_b { Bagel { toppings } };

  bagel_b.inspect();

  return 0;
}

