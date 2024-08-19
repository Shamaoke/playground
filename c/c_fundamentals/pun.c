// #include <stdio.h>
//
// int sqr (n) { return n * n; }
//
// int add (m, n) { return m + n; }
//
// int g (y, z) { return add( sqr(y), sqr(z) ); }
//
// int main(void) {
//   printf("The sum of 2 squared and 3 squared is %d.\n", g(2, 3));
//   return 0;
// }

#include <stdio.h>

/* :::misc::: */
int sqr (n)    { return n * n; }
int add (m, n) { return m + n; }
int g   (y, z) { return add( sqr(y), sqr(z) ); }

/* :::main::: */
int main (void)
  { printf( "The sum of 2 squared and 3 squared is %d.\n", g(2, 3) );

    return 0; }
