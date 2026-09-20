
#include "parameter_descriptor.hh"

ParameterDescriptor::ParameterDescriptor(
  int id,
  std::string name,
  std::size_t byte,
  std::size_t size,
  std::int64_t rawMin,
  std::int64_t rawMax,
  double valueMin,
  double valueMax,
  std::string unit
) :
  id { id },
  name { name },
  byte { byte },
  size { size },
  rawMin { rawMin },
  rawMax { rawMax },
  valueMin { valueMin },
  valueMax { valueMax },
  unit { unit }
{ }


auto ParameterDescriptor::getId( ) const -> int { return id; }

auto ParameterDescriptor::getName( ) const -> const std::string& { return name; }

auto ParameterDescriptor::getByte( ) const -> std::size_t { return byte; }

auto ParameterDescriptor::getSize( ) const -> std::size_t { return size; }

auto ParameterDescriptor::getRawMin( ) const -> std::int64_t { return rawMin; }

auto ParameterDescriptor::getRawMax( ) const -> std::int64_t { return rawMax; }

auto ParameterDescriptor::getValueMin( ) const -> double { return valueMin; }

auto ParameterDescriptor::getValueMax( ) const -> double { return valueMax; }

auto ParameterDescriptor::getUnit( ) const -> const std::string& { return unit; }

