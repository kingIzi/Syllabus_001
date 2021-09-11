import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Syllabus10 1.0
import "../syControls"
import "../../imports/SyConstantScripts.js" as SyConstants


Page{
    id: coursesSelectionPage
    property alias selectCourse: coursesSelectionPage
    SyInnerBackground{id: formBackground}
    background: Rectangle { color: "transparent" }
    Pane{
        id: welcomeMsg
        implicitHeight: msg.implicitHeight
        implicitWidth: msg.implicitWidth
        width: parent.width
        z: 1
        padding: formBackground.anchors.topMargin
        topPadding: 0
        Text{
            Material.elevation: 2
            id: msg
            text: "Almost done!"
            font: Constants.headerFont
            wrapMode: Text.WordWrap
            width: parent.width
            padding: 32
            Material.foreground: Material.Dark
            horizontalAlignment: Text.AlignHCenter
            color: "black"
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
        Text{
            Layout.fillWidth: true
            Layout.margins: 20
            text: "Select your subject interests"
            font: Constants.largeFont
            color: "black"
            Layout.alignment: Qt.AlignHCenter
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
                    Material.accent: Material.color(Material.LightBlue)
                    Layout.leftMargin: 4
                    font: Constants.font
                    Material.foreground: "black"
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
                actionName: "Done"
                width: 100
                Material.foreground: "white"
                background: Rectangle{
                    border.width: 0
                    color: Material.color(Material.LightBlue)
                    radius: 8
                }
                onClicked: {
                    appLoader.sourceComponent = homePage
                }
            }
            SyButton{
                width: 100
                actionName: "Prev"
                Layout.alignment: Qt.AlignRight
                onClicked: syStackViewLoginItem.pop()
            }
        }
    }

}
