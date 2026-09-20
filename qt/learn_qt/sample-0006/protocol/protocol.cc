
#include <algorithm>

#include "protocol.hh"

Protocol::Protocol(
  std::string version,
  std::vector<ParameterDescriptor> items
) :
  version { version },
  items { items }
{ }

auto Protocol::getVersion( ) const -> const std::string& { return version; }

auto Protocol::getItems( ) const -> const std::vector<ParameterDescriptor>& { return items; }

auto Protocol::findById(int id) const -> std::optional<ParameterDescriptor> {

  auto f {
    [id](const ParameterDescriptor& item) {
      return item.getId( ) == id;
    }
  };

  auto it { std::ranges::find_if(items, f) };

  if (it != items.end( )) return *it;

  return std::nullopt;
}

