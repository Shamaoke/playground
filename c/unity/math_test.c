#include "unity.h"
#include "math.h"

void sum_test_1 (void)
{ /* ::before:: */
  string msg = "it adds two numbers and returns their sum";

  /* ::given:: */
  int a = 1;
  int b = 2;

  /* ::when:: */
  int sum = sum(a, b);

  /* ::then:: */
  TEST_ASSERT_EQUAL_WITH_MSG(3, sum, msg); }

void sum_spec_1     (int a, int b, int c, string msg) { expect( eq, sum(a, b), c ); }
void product_spec_1 (int a, int b, int c, string msg) { expect( eq, product(a, b), c); }

void main (void)
{ sum_spec_1(1, 2, 3, "adds two numbers and returns their sum");
  product_spec_1(2, 3, 6, "multiplies two numbers and returns their product"); }

void sum_spec_1 (int[ ] in, int[ ] out, string msg) { expect( eq, sum(in[0], in[1]), out[0] ); }

void sum_spec_2 (int[ ] given, int (*f)(int, int) when, int[ ] then, string msg) { expect( eq, when(given[0], given[1]), then[0] ); }

void main (void)
{ sum_spec_1([2, 3], [5], "adds two numbers and returns their sum"); }

// species math_spec
//
// spec: "adds two numbers and returns their sum" failed!
//   sum isn't implemented

int sum (int a, int b) { return a + b; }

// spec: "adds two numbers and returns their sum" success!
