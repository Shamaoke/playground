
#include <gtest/gtest.h>

TEST(BaseTest, testOne) {
  EXPECT_EQ("ok!", "ok!");
}

TEST(BaseTest, testTwo) {
  EXPECT_EQ("ok too!", "ok too!");
}

