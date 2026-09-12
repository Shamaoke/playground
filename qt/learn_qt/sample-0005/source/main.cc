
#include <QGuiApplication>
#include <QQmlApplicationEngine>

auto main(int argc, char** argv) -> int {

  auto app { QGuiApplication { argc, argv } };
  auto engine { QQmlApplicationEngine { } };

  // auto window { QUrl { "qrc:/learn_qt/sample_0005/views/Application.qml" } };

  // engine.load(window);

  engine.loadFromModule("learn_qt.sample_0005", "Application");

  auto result { app.exec() };

  return result;
}

