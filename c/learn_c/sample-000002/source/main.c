
#include <stdlib.h>

int f(void) { int n = 0; return n; }

int g(void) { int n = f( ) + 1; return n; }

int h(void) { int n = g( ) + 1; return n; }

int main(int argc, char** argv, char** env) {

  int n = h( );

  return EXIT_SUCCESS;
}

