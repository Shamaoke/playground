
///
/// ::: Classes | Constructors | Members initialization | Lib | Inerface :::
///

#pragma once

#include <format>
#include <string>

namespace members_initialization {

  class Person {
    private:
      std::string name { };
      std::string surname { };
    public:
      Person( ) = default;
      Person(std::string name, std::string surname);

      auto get_name( ) const -> decltype(this->name);
      auto get_surname( ) const -> decltype(this->surname);
  };

  class Employee {
    private:
      Person person { };
      std::string position { };
    public:
      Employee(Person& person, std::string position);

      auto get( ) const -> std::string;

      auto get_position( ) const -> decltype(this->position);
  };
}

