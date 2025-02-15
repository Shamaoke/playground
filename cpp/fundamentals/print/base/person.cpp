
///
/// ::: Print | Person :::
///

#include "person.hpp"

Person::Person(std::string name, std::string surname) :
  name { name },
  surname { surname }
{ }

auto Person::get_full_name( ) const -> std::string {
// auto Person::get_full_name( ) const -> std::string_view {

  // auto result { std::format("{0} {1}", this->name, this->surname) };
  // Will result of
  // warning: address of stack memory associated with local variable 'result' returned [-Wreturn-stack-address]
  //     48 |         return result;
  //        |                ^~~~~~

  // std::string full_name { std::format("{0} {1}", this->name, this->surname) };

  // auto result { std::string_view { full_name.data() } };
  // auto result { static_cast<std::string_view>(full_name) };

  auto result { std::format("{0} {1}", this->name, this->surname) };

  return result;
}

