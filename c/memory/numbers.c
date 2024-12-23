
///
/// ::: Numbers :::
///

#include <stdlib.h>
#include <stdio.h>

typedef struct {
  int a;
  int b;
  int c;
} Numbers;

int main(int argc, char* argv[ ]) {

  Numbers* numbers_p = malloc(sizeof *numbers_p);

  // numbers_p->a = 0;
  // numbers_p->b = 1;
  // numbers_p->c = 2;

  // (*numbers_p).a = 0;
  // (*numbers_p).b = 1;
  // (*numbers_p).c = 2;

  *numbers_p = (Numbers) { .a = 0, .b = 1, .c = 2 };

  printf("a: %d;\nb: %d;\nc: %d;\n", numbers_p->a, numbers_p->b, numbers_p->c);

  free(numbers_p);

  return 0;
}

