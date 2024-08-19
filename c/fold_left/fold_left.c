#include <stdio.h>

typedef struct ListRef
  { int v;
    struct ListRef *n; } List;

int main (void)
  { struct List e1 = { .v = 4, .n ..?
