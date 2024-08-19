
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

#include "data_object.h"

auto main(int argc, char** argv) -> int {
  QGuiApplication app { argc, argv };

  // QQmlApplicationEngine engine { };

  QList<QObject *> dataList {
    new DataObject { "Pavel", "Alekhin" },
    new DataObject { "Elena", "Khortyuk" },
    new DataObject { "Jack", "The Ripper" },
    new DataObject { "John", "Smith" }
  };

  QQuickView view { };

  view.setInitialProperties({{ "model", QVariant::fromValue(dataList) }});
  view.setSource(QUrl("qrc:/components/ListViewSample.qml"));
  view.show();

  // QUrl qml_main { "qrc:/main.qml" };

  // engine.load(qml_main);

  return app.exec();
}

