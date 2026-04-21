
#include <stdlib.h>

int f( ) { int n = 0; return n; }

int g( ) { int n = f( ) + 1; return n; }

int h( ) { int n = g( ) + 1; return n; }

int main(int argc, char** argv, char** env) {

  int n = h( );

  return EXIT_SUCCESS;
}

