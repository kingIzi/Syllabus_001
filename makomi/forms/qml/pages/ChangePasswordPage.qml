import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../components"

Page{
    id: changePasswordPage
    contentItem: Flickable{
        contentHeight: changePasswordColumn.height
        ColumnLayout{
            id: changePasswordColumn
            height: implicitHeight
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
            }
            Label {
                text: qsTr("Change Password")
                padding: 10
                font: Constants.constantsFonts.secondaryFont
            }
            Repeater{
                model: [{"label":"Current password","placeHolderText":"Enter current password"},{"label":"New password","placeHolderText":"Enter new password"},{"label":"Confirm password","placeHolderText":"Enter new password"}]
                delegate: ColumnLayout{
                    Layout.fillWidth: true
                    Layout.margins: 10
                    Label {
                        text: modelData.label
                        font: Constants.constantsFonts.primaryFont
                    }
                    TextField{
                        Material.accent: Material.Blue
                        Material.foreground: "#000"
                        placeholderText: modelData.placeHolderText
                        Layout.fillWidth: true
                        font: Constants.constantsFonts.primaryFont
                        echoMode: "Password"
                    }
                }
            }
            Label {
                text: qsTr("Passwords must match")
                horizontalAlignment: "AlignHCenter"
                color: Material.color(Material.Red,Material.Shade600)
                padding: 10
                font: Constants.constantsFonts.secondaryFont
                Layout.alignment: Qt.AlignHCenter
                visible: false
            }
            ActionButton{
                Layout.alignment: Qt.AlignRight
                text: "Save"
                Layout.margins: 10
            }
        }
    }
}
