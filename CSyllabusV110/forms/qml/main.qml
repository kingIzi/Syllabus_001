import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "components"

ApplicationWindow {
    id: root
    GuiConstants { id: constants }
    property bool isReady: true
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
        active: visible
        visible: true
        sourceComponent: StackView{
            id: syStack
            initialItem: LoginForm{}
        }
    }
}


