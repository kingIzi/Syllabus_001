import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Syllabus10 1.0
import "../../imports/SyConstantScripts.js" as SyConstants
import "../../imports/syComponentsScripts.js" as SyComponents


TextField{
    id: syTextField
    property string leftIcon
    property string rightIcon
    Material.accent: Material.LightBlue
    Material.foreground: "#000"
    font: Constants.font
    maximumLength: 50
    leftPadding: syTextField.text.length === 0 ? 28 : 0
    rightPadding: (syTextField.leftPadding <= 0) ? 24 : 0
    verticalAlignment: "AlignVCenter"
    Label{
        id: syTextFieldLeftIcon
        text: syTextField.leftIcon
        visible: syTextField.text.length === 0 ? true : false
        anchors{
            left: syTextField.left
            top: syTextField.top
            verticalCenter: syTextField.verticalCenter
            leftMargin: 4
        }
    }
    Label{
        id: syTextFieldRightIcon
        text: syTextField.rightIcon
        visible: syTextField.text.length === 0 ? false : true
        anchors{
            right: syTextField.right
            top: syTextField.top
            verticalCenter: syTextField.verticalCenter
            rightMargin: 10
        }
        MouseArea{
            anchors.fill: syTextFieldRightIcon
            onClicked: SyComponents.toggleSyTextFieldRightIcon(syTextField,SyConstants.fontello)
        }
    }
}
