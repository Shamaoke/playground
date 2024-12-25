
#include <gtest/gtest.h>

#include "main.hpp"

using namespace testing;

class DerivedTest : public Test {

  private:
    std::string expected { };
    std::string actual   { };

  public:
    auto SetUp( ) -> void override {

      auto derived { Derived { } };

      this->expected = "ok!";
      this->actual = derived.do_one();
    }

    auto get_actual( ) -> decltype(this->actual) { return this->actual; }

    auto get_expected( ) -> decltype(this->expected) { return this->expected; }
};

TEST_F(DerivedTest, do_one) { EXPECT_EQ(get_actual(), get_expected()); }

// TEST(DerivedTest, do_one) {
//
//   auto derived { Derived { } };
//
//   auto expected { "ok!" };
//   auto actual   { derived.do_one() };
//
//   EXPECT_EQ(actual, expected);
// }

auto main(int argc, char* argv[ ]) -> int {

  InitGoogleTest(&argc, argv);

  auto result { RUN_ALL_TESTS() };

  return result;
}

