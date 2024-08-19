export module math;

#include <cstdio>

/***
 * Find the integer square root
 * details: `https://en.wikipedia.org/wiki/Integer_square_root`
 ***/
export constexpr int isqrt(int n) {
  int i = 1;

  while (i * i < n) i++;

  int result = i - (i * i != n);

  return result;
}

export int main( ) { return 0; }

