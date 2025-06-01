
///
/// ::: Classes | Constructors | Members initialization | Lib | Realization :::
///

#include <libmembers_initialization/libmembers_initialization.hpp>

namespace members_initialization {

  Person::Person(std::string name, std::string surname) :
    name { name },
    surname { surname }
  { }

  auto Person::get_name( ) const -> decltype(this->name) {
    return this->name;
  }

  auto Person::get_surname( ) const -> decltype(this->name) {
    return this->surname;
  }

  Employee::Employee(Person& person, std::string position) :
    person { person },
    position { position }
  { }

  auto Employee::get( ) const -> std::string {

    auto result {
      std::format(
        "{0} {1} — {2}",
        this->person.get_name(),
        this->person.get_surname(),
        this->get_position()
      )
    };

    return result;
  }

  auto Employee::get_position( ) const -> decltype(this->position) {
    return this->position;
  }
}

