
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlComponent>
#include <QVariantMap>
#include <QVariant>
#include <QByteArray>
#include <QUrl>
#include <QDebug>

#include <Spix/AnyRpcServer.h>
#include <Spix/QtQmlBot.h>

#include "status_provider.hh"

auto main(int argc, char** argv) -> int {

  auto app { QGuiApplication { argc, argv } };
  auto statusProvider { StatusProvider { } };
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

          required property QtObject statusProvider

          property string status: main.statusProvider.ready( )

          width: 800
          height: 600

          color: "#ffffff"

          Column {

            spacing: 10

            anchors.centerIn: parent

            Rectangle {

              id: button

              property bool spacePressed: false
              property bool mousePressed: mouseArea.pressed

              objectName: "button"

              anchors.horizontalCenter: parent.horizontalCenter

              width: 180
              height: 60

              radius: 6

              color: (mousePressed || spacePressed) ? "#aa2266" : "#2266aa"

              focus: true

              Text {

                anchors.centerIn: parent

                font.family: "Iosevka Aile Semibold"
                font.pixelSize: 24

                color: "#ffffff"

                text: "Нажать"
              }

              MouseArea {

                id: mouseArea

                anchors.fill: parent

                onPressed: main.status = main.statusProvider.mousePressed( )
              }

              Keys.onSpacePressed: ( ) => {
                button.spacePressed = true
                main.status = main.statusProvider.spacePressed( )
              }

              Keys.onReleased: (event) => {
                if (event.key == Qt.Key_Space) {
                  button.spacePressed = false
                  event.accepted = true
                }
              }
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

  auto initialProperties {
    QVariantMap {
      { "statusProvider", QVariant::fromValue(&statusProvider) }
    }
  };

  auto root {
    component.createWithInitialProperties(initialProperties)
  };

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
