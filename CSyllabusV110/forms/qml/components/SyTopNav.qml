import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "qrc:/forms/imports/syConstants.js" as SyConstants



ToolBar{
    id: syNavBar
    background: Rectangle{ color: "transparent" }
    RowLayout{
        anchors.fill: parent
        Rectangle{
            id: settings
            radius: settings.width / 2
            Layout.preferredWidth: userCredentials.font.pixelSize * 2
            Layout.preferredHeight: userCredentials.font.pixelSize * 2
            color: Material.color(Material.Grey)
            Layout.leftMargin: 4; Layout.topMargin: 4
            Text {
                id: userCredentials
                text: qsTr("JD")
                anchors.centerIn: parent
                font.pixelSize: 20
                font.family: "Times New Roman"
                font.letterSpacing: 2
            }
        }
        SyIcon{
            fontCode: SyConstants.fontello.search
            color: "black"
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 4
            opacity: 1
            Layout.fillWidth: true
        }
        SyIcon{
            fontCode: SyConstants.fontello.heart
            color: "black"
            Layout.alignment: Qt.AlignRight
            Layout.rightMargin: 4; Layout.topMargin: 4
            opacity: 1
        }
    }
}
