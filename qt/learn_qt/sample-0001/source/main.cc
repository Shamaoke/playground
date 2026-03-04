
#include <QCoreApplication>

#include "sample.hh"

auto main(int argc, char** argv) -> int {

  auto app { QCoreApplication { argc, argv } };

  auto sample { new Sample { } };

  Q_EMIT sample->qtimer_start( );

  auto result { app.exec( ) };

  return result;
}

