
#include <QGuiApplication>

auto main(int argc, char** argv) -> int {

  auto app { QGuiApplication { argc, argv } };

  auto result { app.exec() };

  return result;
}

