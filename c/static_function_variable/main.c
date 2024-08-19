
#include <stdio.h>

#include "function.h"

int main( ) {
  int result;

  for (int i = 0; i < 6; i = i + 1)
    result = count( );

  printf("the counter is %d\n", result); //=> 6

  return 0;
}

