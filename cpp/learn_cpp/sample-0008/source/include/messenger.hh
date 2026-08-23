
#pragma once

#include <string>

class Messenger {

  private:
    const std::string message { "Welcome to Sample 0008!" };

  public:
    auto get_message() const -> std::string;
};

