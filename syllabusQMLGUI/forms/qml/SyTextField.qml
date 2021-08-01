import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "qrc:/forms/imports/registration.js" as LoginScript


Rectangle{
    id: inputTextFieldRect
    property string placeHolderText: "Username"
    property string leftIcon: "\uE803"
    property string rightIcon: "\uE800"
    color: "#010708"
    opacity: 0.5
    radius: 50
    border.color: "#53d8e8"
    border.width: 0
    Layout.preferredHeight: 30
    TextField{
        id: inputTextField
        anchors.fill: parent
        color: "#fff"
        font.pixelSize: 20
        font.family: "Times New Roman"
        placeholderText: inputTextFieldRect.placeHolderText
        leftPadding: 34
        rightPadding: 24
        background: Rectangle { color: "transparent" }
        onFocusChanged: {
            LoginScript.onFocusChangedLoginInputField(inputTextField,inputTextFieldRect)
        }
    }
    IconLabel{
        id: userIcon
        text: inputTextFieldRect.leftIcon
        color: "white"
        opacity: 0.8
        visible: inputTextField.text.length === 0 ? true : false
        font.family: "Fontello"
        font.pixelSize: 20
        anchors{
            left: inputTextFieldRect.left
            top: inputTextFieldRect.top
            verticalCenter: parent.verticalCenter
            leftMargin: 10
        }
        onVisibleChanged: {
            LoginScript.onVisbleChangedToogleTextfieldLeftPadding(userIcon,inputTextField)
        }
    }
    IconLabel{
        id: cancelUsername
        text: inputTextFieldRect.rightIcon
        color: "white"
        visible: inputTextField.text.length === 0 ? false : true
        font.family: "Fontello"
        font.pixelSize: 20
        anchors{
            right: inputTextFieldRect.right
            top: inputTextFieldRect.top
            verticalCenter: parent.verticalCenter
            rightMargin: 10
        }
        MouseArea{
            anchors.fill: cancelUsername
            onClicked: inputTextField.text = ""
        }
    }
}
