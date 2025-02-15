
#pragma once

///
/// ::: Print | Person :::
///

#include <format>
#include <string>

class Person {

  private:
    std::string name { };
    std::string surname { };

  public:
    Person(std::string name, std::string surname);

    // auto get_full_name( ) const -> std::string_view;
    auto get_full_name( ) const -> std::string;
};

