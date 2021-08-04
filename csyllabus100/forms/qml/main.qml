import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "qrc:/forms/imports/registration.js" as LoginScript

ApplicationWindow {
    id: root
    GuiConstants { id: constants }
    width: constants.width
    height: constants.height
    visible: true
    title: qsTr("Syllabus")
    minimumWidth: constants.minimumWidth
    minimumHeight: constants.minimumHeight
    maximumHeight: constants.maximumHeight
    maximumWidth: constants.maximumWidth
    Material.theme: Material.Dark
    Loader{
        id: appLoader
        anchors.fill: parent
        source: LoginScript.pages.loginForm
        active: visible
        visible: true
    }
}


