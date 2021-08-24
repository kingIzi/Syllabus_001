import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0
import "./components/syControls"

ApplicationWindow {
    id: root
    property bool showNavBar: false
    visible: true
    title: qsTr("Syllabus")
    width: Constants.width
    height: Constants.height
    minimumWidth: Constants.width
    minimumHeight: 580
    Material.theme: Material.Light
    footer: SyNavBar{
        id: navBar
        visible: root.showNavBar
    }
    Loader{
        id: appLoader
        anchors.fill: parent
        active: visible
        visible: true
        sourceComponent: LoginPage{}
    }
}


