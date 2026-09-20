
#pragma once

#include <optional>
#include <string>
#include <vector>

#include "parameter_descriptor.hh"

class Protocol {

  private:
    std::string version;
    std::vector<ParameterDescriptor> items;

  public:
    Protocol(
      std::string version,
      std::vector<ParameterDescriptor> items
    );

    auto getVersion( ) const -> const std::string&;

    auto getItems( ) const -> const std::vector<ParameterDescriptor>&;

    auto findById(int id) const -> std::optional<ParameterDescriptor>;
};

