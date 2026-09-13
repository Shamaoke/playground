
import QtQuick
import learn_qt.sample_0005

Item {

  UserModel { id: userModel }

  ListView {

    model: userModel

    anchors.fill: parent

    delegate: Text {
      text: `${model.id}: ${model.name} <${model.email}>`
    }
  }
}

