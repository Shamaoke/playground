
#pragma once

#include <cstddef>
#include <cstdint>
#include <string>

class ParameterDescriptor {

  private:
    int id;
    std::string name;
    std::size_t byte;
    std::size_t size;
    std::int64_t rawMin;
    std::int64_t rawMax;
    double valueMin;
    double valueMax;
    std::string unit;

  public:
    ParameterDescriptor(
      int id,
      std::string name,
      std::size_t byte,
      std::size_t size,
      std::int64_t rawMin,
      std::int64_t rawMax,
      double valueMin,
      double valueMax,
      std::string unit
    );

    auto getId( ) const -> int;

    auto getName( ) const -> const std::string&;

    auto getByte( ) const -> std::size_t;

    auto getSize( ) const -> std::size_t;

    auto getRawMin( ) const -> std::int64_t;

    auto getRawMax( ) const -> std::int64_t;

    auto getValueMin( ) const -> double;

    auto getValueMax( ) const -> double;

    auto getUnit( ) const -> const std::string&;
};

