
#include <iostream>
#include <string>

#include <libexplicit/libexplicit.hpp>

namespace my_explicit {

  SampleOne::SampleOne(std::string data) {

    std::cout << "SampleOne::SampleOne(std::string data) is called." << '\x{a}';

    this->data = data;
  }

  auto SampleOne::get_data( ) -> decltype(this->data) { return this->data; }

  SampleTwo::SampleTwo(std::string data) {

    std::cout << "SampleTwo::SampleTwo(std::string data) is called." << '\x{a}';

    this->data = data;
  }

  auto SampleTwo::get_data( ) -> decltype(this->data) { return this->data; }

  SampleTwo::operator std::string( ) const { return this->data; }

  // template<>
  // auto print_data<SampleOne>(SampleOne& sample_one) -> void {

  //   std::cout << sample_one.get_data() << '\x{a}';

  //   return void();
  // }
};


