//
// :::message:::
//

export module message;

// import <iostream>;
// import <format>;

import std;

export void print_message();

void print_message() {
  std::cout << std::format("Hello, {}!\n", "world");
}

