import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "qrc:/forms/imports/registration.js" as Register
import "qrc:/forms/imports/syConstants.js" as SyConstants


TextField{
    id: syTextField
    property string leftIcon: ""
    property string rightIcon: SyConstants.fontello.close
    width: 340
    height: 40
    Material.accent: Material.Teal
    Material.foreground: "#eee"
    font.pixelSize: 18
    maximumLength: 50
    leftPadding: syTextField.text.length === 0 ? 28 : 0
    verticalAlignment: "AlignVCenter"
    SyIcon{
        id: syTextFieldLeftIcon
        font.pixelSize: 20
        fontCode: syTextField.leftIcon
        visible: syTextField.text.length === 0 ? true : false
        anchors{
            left: syTextField.left
            top: syTextField.top
            verticalCenter: syTextField.verticalCenter
            leftMargin: 4
        }
    }
    SyIcon{
        id: syTextFieldRightIcon
        fontCode: syTextField.rightIcon
        visible: syTextField.text.length === 0 ? false : true
        anchors{
            right: syTextField.right
            top: syTextField.top
            verticalCenter: syTextField.verticalCenter
            rightMargin: 10
        }
        MouseArea{
            anchors.fill: syTextFieldRightIcon
            onClicked: Register.toggleSyTextFieldRightIcon(syTextField)
        }
    }
}


