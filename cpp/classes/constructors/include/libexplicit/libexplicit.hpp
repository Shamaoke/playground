
#pragma once

#include <string>

///
/// Details
/// -------
/// • [explicit specifier - cppreference.com](https://en.cppreference.com/w/cpp/language/explicit)
///
/// • [Copy-initialization - cppreference.com](https://en.cppreference.com/w/cpp/language/copy_initialization)
///

namespace my_explicit {

  class SampleOne {

    private:
      std::string data { };

    public:
      SampleOne(std::string data);

      auto get_data( ) -> decltype(this->data);
  };

  class SampleTwo {

    private:
      std::string data { };

    public:
      explicit SampleTwo(std::string data);

      auto get_data( ) -> decltype(this->data);

      explicit operator std::string( ) const;
  };

  // template<typename T>
  // auto print_data(T& sample) -> void;

  template<typename T>
  auto print_data(T sample) -> void {

    std::cout << sample.get_data() << '\x{a}';

    return void();
  }
}

