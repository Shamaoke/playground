
#include <QCoreApplication>

#include "counter.hh"

auto main(int argc, char** argv) -> int {

  auto app { QCoreApplication  { argc, argv } };

  auto counter { Counter { } };

  Q_EMIT counter.start( );

  auto result { app.exec( ) };

  return result;
}

