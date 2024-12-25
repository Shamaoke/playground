
#include <gtest/gtest.h>

#include "main.hpp"

using namespace testing;

class DerivedTest : public Test {

  public:
    std::string expected { };
    std::string actual { };
    Derived derived { };

    static auto SetUpTestSuite( ) -> void { std::cout << "Setting up test suite" << "\n"; }

    static auto TearDownTestSuite( ) -> void { std::cout << "Tearing down test suite" << "\n"; }

    auto SetUp( ) -> void override { std::cout << "Seting up" << "\n"; }

    auto TearDown( ) -> void override { std::cout << "Tearing down" << "\n"; }
};

TEST_F(DerivedTest, do_one) {

  expected = "ok!";
  actual   = derived.do_one();

  EXPECT_EQ(actual, expected);
}

TEST_F(DerivedTest, do_two) {

  expected = "ok too!";
  actual   = derived.do_two();

  EXPECT_EQ(actual, expected);
}

TEST_F(DerivedTest, do_three) {

  expected = "ok free!";
  actual   = derived.do_three();

  EXPECT_EQ(actual, expected);
}

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

