import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../"
import "qrc:/forms/imports/registration.js" as LoginScript

ColumnLayout{
    id: registerForm
    SyTextField{
        id: userInputRect
        Layout.fillWidth: true
        Layout.margins: 20
    }
    SyTextField{
        id: emailInputRect
        placeHolderText: "Enter email address"
        leftIcon: "\uF0e0"
        Layout.fillWidth: true
        Layout.margins: 20
    }
    SyPasswordField{
        id: createPassword
        placeHolderText: "Create password"
        Layout.preferredHeight: 30
        Layout.fillWidth: true
        Layout.margins: 20
    }
    SyPasswordField{
        id: confirmPassword
        placeHolderText: "Confirm password"
        Layout.preferredHeight: 30
        Layout.fillWidth: true
        Layout.margins: 20
    }
    SyText{
        id: registerErrorMessage
        text: qsTr("Password entries must match")
        font.pixelSize: 18
        color: "red"
        lineHeight: 4
        wrapMode: Text.WordWrap
        Layout.fillWidth: false
        horizontalAlignment: Text.AlignHCenter
        Layout.alignment: Qt.AlignHCenter
    }
    SyButton{
        id: loginBtn
        actionName: "Register"
        Layout.fillWidth: true
        Layout.preferredHeight: 40
        Layout.margins: 20
        MouseArea{
            anchors.fill: parent
            onClicked: {
                const filename = LoginScript.pages.studiesSelection
                LoginScript.addStackViewElement(filename,{},register)
            }
            cursorShape: "PointingHandCursor"
            hoverEnabled: true
        }
    }
    SyText{
        id: loginText
        text: qsTr("Login now.")
        color: "lightblue"
        font.underline: true
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        MouseArea{
            anchors.fill: loginText
            onClicked: registerLoader.setSource(LoginScript.pages.loginForm)
        }
    }
    SignupOptions{
        id: signupOptions
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
    }
}
