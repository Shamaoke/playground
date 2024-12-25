
#pragma once

#include <iostream>
#include <string>

class Base {

  public:
    virtual auto do_one( ) const -> std::string = 0;

    virtual auto do_two( ) const -> std::string = 0;

    virtual auto do_three( ) const -> std::string { return "ok free!"; }
};

class Derived : public Base {

  public:
    auto do_one( ) const -> std::string override { return "ok!"; }

    auto do_two( ) const -> std::string override { return "ok too!"; }
};

