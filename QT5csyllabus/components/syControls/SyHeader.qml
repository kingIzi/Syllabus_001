import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QT5csyllabus
import "../../imports/SyComponentsScripts.js" as SyComponents

Pane{
    Material.background: "white"
    Material.elevation: 2
    width: parent.width
    height: 100
    property int currentIndex: homeTab.currentIndex
    RowLayout{
        id: homePageHeader
        width: parent.width
        height: 50
        implicitHeight: 50
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            margins: 10
        }
        RoundButton{
            Layout.leftMargin: 12
            Layout.alignment: Qt.AlignLeft
            text: SyComponents.fontello.thLarge
            Material.background: Material.LightBlue
            Material.foreground: Constants.backgroundColor
        }
        Text {
            id: name
            text: qsTr("Home")
            font: Constants.largeFont
            Layout.alignment: Qt.AlignHCenter
        }
        RoundButton{
            Layout.rightMargin: 12
            Layout.alignment: Qt.AlignRight
            text: SyComponents.fontello.search
            Material.background: Material.LightBlue
            Material.foreground: Constants.backgroundColor
        }
    }
    SyHomeTab{
        id: homeTab
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.topMargin: 10
    }
}
