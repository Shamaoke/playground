
#include <iostream>
#include <string>

class Base {

  public:
    virtual auto do_one( ) const -> std::string = 0;
};

class Derived : Base {

  public:
    auto do_one( ) const -> std::string override { return "ok!"; }
};

