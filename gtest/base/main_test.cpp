
#include <gtest/gtest.h>

auto main(int argc, char* argv[ ]) -> int {

  testing::InitGoogleTest(&argc, argv);

  auto result { RUN_ALL_TESTS() };

  return result;
}

