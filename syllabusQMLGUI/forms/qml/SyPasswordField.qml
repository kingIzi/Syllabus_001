import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/forms/imports/registration.js" as LoginScript

Rectangle{
    id: passwordInputRect
    property string placeHolderText: "Password"
    property string leftIcon: "\uE804"
    property string rightIcon: "\uE801"
    color: "#010708"
    opacity: 0.5
    radius: 50
    border.color: "#53d8e8"
    border.width: 0
    Layout.preferredHeight: 30
    TextField{
        id: passwordField
        anchors.fill: parent
        color: "#fff"
        font.pixelSize: 20
        leftPadding: 34
        rightPadding: 34
        font.family: "Times New Roman"
        placeholderText: passwordInputRect.placeHolderText
        echoMode: TextField.Password
        background: Rectangle { color: "transparent" }
        onFocusChanged: {
            LoginScript.onFocusChangedLoginInputField(passwordField,passwordInputRect)
        }
    }
    IconLabel{
        id: passwordIcon
        text: passwordInputRect.leftIcon
        color: "white"
        visible: passwordField.text.length === 0 ? true : false
        font.family: "Fontello"
        font.pixelSize: 20
        opacity: 0.8
        anchors{
            left: passwordInputRect.left
            top: passwordInputRect.top
            verticalCenter: parent.verticalCenter
            leftMargin: 10
        }
        onVisibleChanged: {
            LoginScript.onVisbleChangedToogleTextfieldLeftPadding(passwordIcon,passwordField)
        }
    }
    IconLabel {
        id: showPassword
        text: passwordInputRect.rightIcon
        color: "white"
        visible: passwordField.text.length === 0 ? false : true
        font.family: "Fontello"
        font.pixelSize: 20
        anchors{
            right: passwordInputRect.right
            top: passwordInputRect.top
            verticalCenter: parent.verticalCenter
            rightMargin: 10
        }
        MouseArea{
            anchors.fill: showPassword
            onClicked: {
                LoginScript.showPassword(passwordField,showPassword)
            }
        }
    }
}
