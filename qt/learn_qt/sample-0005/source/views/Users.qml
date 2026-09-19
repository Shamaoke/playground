
import QtQuick
import learn_qt.sample_0005

Item {

  UserModel { id: userModel }

  ListView {

    model: userModel

    anchors.fill: parent

    delegate: Text {

      required property string id
      required property string name
      required property string email

      text: `${id}: ${name} <${email}>`
    }
  }
}

