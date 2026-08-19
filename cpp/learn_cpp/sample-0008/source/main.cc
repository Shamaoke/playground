
///
/// ::: Sample 0008 :::
///

// #include <iostream>
#include <print>
#include <ranges>
#include <memory>

#include "include/messenger.hh"

auto main(int argc, char** argv, char** env) -> int {

  using namespace std::literals::string_view_literals;
  using namespace std::views;
  using namespace std::ranges;

  using std::toupper;
  using std::print;

  // auto messenger { new Messenger { } };

  auto messenger { std::make_unique<Messenger>() };

  auto message { messenger->get_message( ) };

  auto g {
    [ ](unsigned char c) { return toupper(c); }
  };

  auto f {
    [&g](auto w) { return w | transform(g); }
  };

  // auto view {
  //   message
  //     | split(' ')
  //     | transform(f)
  // };

  // for (auto word : view) {
  //   for (char c : word) {
  //     std::cout << c;
  //   }
  //   std::cout << " ~> ";
  // }

  // for (auto word : view) {
  //   print("{} ~> ", std::ranges::to<std::string>(word));
  // }

  auto result {
    message
      | split(' ')
      | transform(f)
      | join_with(" ~> "sv)
      | to<std::string>( )
  };

  print("{} ~> \n", result);

  // delete messenger;

  return 0;
}

