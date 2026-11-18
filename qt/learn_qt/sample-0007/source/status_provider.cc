
#include "status_provider.hh"

auto StatusProvider::ready( ) const -> QString {
  return readyStatus;
}

auto StatusProvider::mousePressed( ) const -> QString {
  return mousePressedStatus;
}

auto StatusProvider::spacePressed( ) const -> QString {
  return spacePressedStatus;
}

