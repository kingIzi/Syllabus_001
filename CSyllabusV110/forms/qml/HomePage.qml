import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects
import "components"
import "qrc:/forms/imports/syConstants.js" as SyConstants



Page{
    id: homePage
    width: parent.width
    height: parent.height
    implicitHeight: parent.implicitHeight
    implicitWidth: parent.implicitWidth
    background: Rectangle { color: "transparent" }
    header: SyTopNav{}
    SyBusy { id: busy }
    Rectangle{
        id: navLine
        width: homePage.width
        height: 1
        opacity: 0.2
        color: "#fffffffff"
        anchors.top: parent.top
        anchors.topMargin: 4
    }
    StackView{
        id: homeStack
        anchors.fill: parent
        initialItem: HomeNav{}
    }

    footer: SyNavBar{}
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
