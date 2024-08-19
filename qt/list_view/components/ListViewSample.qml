
import QtQuick 2.15

ListView {
  id: listViewSample

  width: 246
  height: 72

  required model

  delegate: Rectangle {
    required property string name
    required property string surname

    width: listViewSample.width
    height: listViewSample.height / 4

    color: "orange"

    Text {
      text: parent.name + " " + parent.surname

      color: "white"
    }
  }
}

