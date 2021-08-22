import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Window 2.15
import QT5csyllabus 1.0


Window {
    id: root
    width: Constants.width
    height: Constants.height
    //flags: Qt.FramelessWindowHint

    Loader{
        id: appLoader
        visible: true
        active: visible
        //sourceComponent: HomePage{}
        sourceComponent: Screen01 {}
        anchors.fill: parent
    }
}
