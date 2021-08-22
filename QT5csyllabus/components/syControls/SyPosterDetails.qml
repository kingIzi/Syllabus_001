import QtQuick 2.15
import QT5csyllabus 1.0

Rectangle {
    width: Constants.width
    height: Constants.height
    Text {
        id: name
        text: qsTr("text")
        anchors.centerIn: parent
    }
}
