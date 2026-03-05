
#include <QCoreApplication>
#include <QObject>

#include "sample.hh"

auto process_qobject(QObject* qobject) -> void { }

auto main(int argc, char** argv) -> int {

  auto app { new QCoreApplication { argc, argv } };

  auto sample { new Sample { } };

  process_qobject(sample);

  auto result { app->exec( ) };

  return result;
}

