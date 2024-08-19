#include <stdio.h>

int sum (int a, int b)
{ return a + b; }

int pass_by_reference (void)
{ int  a = 2;
  int  b = 3;
  int *c = &b;

       b = 4;

  return sum(a, *c); }

int pass_by_value (void)
{ int a = 2;
  int b = 3;
  int c = b;

      b = 4;

  return sum(a, c); }

int main (void)
{ printf( "%d\n", pass_by_reference() ); //-> 6, since `b' was changed and `c' is
                                         //   a reference to `b', *c = &b

  printf( "%d\n", pass_by_value() );     //-> 5, since the value of `b' was copied
                                         //   into `c', c = b, and thus subsequent
                                         //   update of `b' doesn't affect `c'

  return 0; }
