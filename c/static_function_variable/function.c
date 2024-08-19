
int count( ) {
  static int counter = 0;

  counter = counter + 1;

  return counter;
}

