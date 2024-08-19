
import QtQuick 2.15
import QtQuick.Window 2.15

Window {
  width: 1024
  height: 768

  title: "Rounded rectangle"

  color: "#ffffff"

  visible: true

  Rectangle {
    id: header

    property int headerWidth: 246
    property int headerHeight: 26

    width: headerWidth
    height: headerHeight

    Rectangle {
      id: first

      width: parent.width
      height: parent.height

      color: "#ff26e849"

      radius: 4
    }

    Rectangle {
      id: second

      width: first.width
      height: first.radius

      color: "#ff26e849"

      anchors.bottom: first.bottom
    }

    Text {
      font {
        family: "Roboto Condensed SemiBold"
        pixelSize: 16
      }

      text: "Байт управления ТП"

      color: "white"

      anchors.fill: parent
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
    }
  }
}

