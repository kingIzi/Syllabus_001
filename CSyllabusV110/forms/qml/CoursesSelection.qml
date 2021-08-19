import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "components"
import "qrc:/forms/imports/syConstants.js" as SyConstants


Page{
    id: registerPage
    width: parent.width
    height: parent.height
    implicitHeight: formBackground.implicitHeight
    implicitWidth: formBackground.implicitWidth
    background: Rectangle { color: "transparent" }
    SyInnerBackground{ id: formBackground; }
    Pane{
        id: welcomeMsg
        implicitHeight: msg.implicitHeight
        implicitWidth: msg.implicitWidth
        width: parent.width
        z: 1
        padding: formBackground.anchors.topMargin
        topPadding: 0
        SyText{
            Material.elevation: 2
            id: msg
            text: "Almost done!"
            font.bold: true
            font.letterSpacing: 2
            font.pixelSize: 40
            wrapMode: Text.WordWrap
            width: parent.width
            padding: 32
            Material.foreground: Material.Dark
            horizontalAlignment: Text.AlignHCenter
        }
    }
    ColumnLayout{
        id: subjects
        anchors{
            top: welcomeMsg.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        SyText{
            Layout.fillWidth: true
            Layout.margins: 20
            font.pixelSize: 20
            text: "Select your subject interests"
            font.letterSpacing: 4
        }
        GridLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 20; Layout.rightMargin: 20;
            Layout.bottomMargin: 20
            clip: true
            columns: root.width < 600 ? 3 : 4
            Repeater{
                model: Array.from({length: 30}, (_, index) => index + 1);
                delegate: CheckBox{
                    Layout.fillWidth: true
                    text: "Subject ID"
                    Material.accent: Material.Teal
                    Layout.leftMargin: 4

                }
            }
        }
        Row{
            id: formComplete
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.rightMargin: 20
            layoutDirection: Qt.RightToLeft
            spacing: 8
            SyButton{
                actionName: "Finish"
                width: 100
                background: Rectangle{
                    border.width: 0
                    color: Material.color(Material.Teal)
                    radius: 20
                }
                onClicked: {
                    appLoader.sourceComponent = undefined;
                    appLoader.source = SyConstants.pages.homePage
                }
            }
            SyButton{
                width: 100
                actionName: "Prev"
                Layout.alignment: Qt.AlignRight
                onClicked: syStack.pop()
            }
        }
    }

}


