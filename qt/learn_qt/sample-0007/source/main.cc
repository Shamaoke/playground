
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlComponent>
#include <QByteArray>
#include <QUrl>
#include <QDebug>

#include <Spix/AnyRpcServer.h>
#include <Spix/QtQmlBot.h>

auto main(int argc, char** argv) -> int {

  auto app { QGuiApplication { argc, argv } };
  auto view { QQuickView { } };
  auto component { QQmlComponent { view.engine( ) } };
  auto url { QUrl { } };

  auto data {
    QByteArray {
      R"qml(
        import QtQuick

        Rectangle {

          id: main

          objectName: "main"

          property string status: "Готов!"

          width: 800
          height: 600

          color: "#ffffff"

          Column {

            spacing: 10

            anchors.centerIn: parent

            Rectangle {

              objectName: "button"

              anchors.horizontalCenter: parent.horizontalCenter

              width: 180
              height: 60

              radius: 6

              color: "#2266aa"

              focus: true

              Text {

                anchors.centerIn: parent

                font.family: "Iosevka Aile Semibold"
                font.pixelSize: 24

                color: "#ffffff"

                text: "Нажать"
              }

              MouseArea {

                anchors.fill: parent

                onClicked: main.status = "Клик мышью!"
              }

              Keys.onSpacePressed: main.status = "Нажат пробел!"
            }

            Text {

              anchors.horizontalCenter: parent.horizontalCenter

              font.family: "Iosevka Aile Semibold"
              font.pixelSize: 24

              color: "#444444"

              text: `Статус | ${main.status}`
            }
          }
        }
      )qml"
    }
  };

  component.setData(data, url);

  auto root { component.create( ) };

  if (root == nullptr) {
    qWarning( ) << component.errors( );
    return 1;
  }

  view.setObjectName("window");
  view.setContent(url, &component, root);
  view.resize(800, 600);
  view.show( );

  auto bot { spix::QtQmlBot { } };
  auto server { spix::AnyRpcServer { 9000 } };

  bot.runTestServer(server);

  auto result { app.exec( ) };

  return result;
}
