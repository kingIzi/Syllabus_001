import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Syllabus10 1.0
import "../../imports/SyConstantScripts.js" as SyConstants


Rectangle{
    width: parent.width
    height: 40
    color: "transparent"
    RowLayout{
        anchors.fill: parent
        spacing: 4
        Repeater{
            model: ["All Subjects","Volumes"]
            delegate: Pane{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.leftMargin: 8
                Layout.rightMargin: 8
                Layout.alignment: Qt.AlignCenter
                Material.elevation: 2
                Material.background: "#fff"
                Label{
                    id: homeOptions
                    text: SyConstants.fontello.user
                    anchors{
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }
                }
                Text {
                    text: qsTr(modelData)
                    font: Constants.font
                    anchors{
                        left: homeOptions.right
                        verticalCenter: parent.verticalCenter
                        leftMargin: 8
                    }
                }
            }
        }
    }
}
