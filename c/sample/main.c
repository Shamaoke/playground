
#include <stdio.h>

#include "function.h"

int main(void) {
  int result;
  char *str;

  result = add(1, 2);
  sprintf(str, "%e", (float) result);
  printf("The result is %s.\n", str);

  return 0;
}

