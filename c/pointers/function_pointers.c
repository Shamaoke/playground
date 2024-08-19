#include <stdio.h>

int sum (int a, int b)
{ return a + b; }

int rabbit (void)
{
  int sum (int a, int b) { return a + b + 1; }

  int (*f)(int, int) = &sum;

  int a = 2;
  int b = 3;

  return f(a, b); }

int main (void)
{ printf( "%d\n", rabbit() );

  return 0; }
