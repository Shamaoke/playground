
// #include <string_view>

#include <gmock/gmock.h>

#include "person.hpp"

using namespace std::string_literals;
// using namespace std::string_view_literals;
using namespace testing;

TEST(PersonTest, get_full_name) {

  auto person { Person { "Pavel"s, "Alekhin"s } };

  auto expected { "Pavel Alekhin"s };

  auto actual { person.get_full_name() };

  EXPECT_THAT(actual, Eq(expected));
}

auto main(int argc, char** argv, char** env) -> int {

  InitGoogleTest(&argc, argv);

  auto result { RUN_ALL_TESTS() };

  return result;
}

