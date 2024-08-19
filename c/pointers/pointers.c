#include <stdio.h>

int sum (int *a, int *b)
{ return *a + *b; }

int rabbit (void)
{ int  a = 2;
  int  b = 3;

  int *c = &a;
  int *d = &b;

       a = 1;
       b = 1;

  return sum(c, d); }


int main (void)
{ printf( "%d\n", rabbit() );

  return 0; }
