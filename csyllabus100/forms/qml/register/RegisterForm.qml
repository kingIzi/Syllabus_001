import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../"
import "qrc:/forms/imports/registration.js" as LoginScript


Page{
    id: regiisterPage
    width: parent.width
    height: parent.height
    implicitHeight: formBackground.implicitHeight
    implicitWidth: formBackground.implicitWidth
    background: Rectangle { color: "transparent" }
    SyInnerBackground{ id: formBackground; }
    SyText{
        id: welcomeMsg
        text: "Please login"
        font.bold: true
        font.letterSpacing: 2
        font.pixelSize: 40
        wrapMode: Text.WordWrap
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        padding: 32
    }
    Loader{
        id: busyLoader
        source: LoginScript.pages.busy
        anchors.fill: registerForm
        visible: false
        active: visible
    }
    ColumnLayout{
        id: registerForm
        PaddedRectangle{ padding: 32 }
        anchors{
            top: welcomeMsg.bottom
            left: parent.left
            right: parent.right
        }
        SyTextField{
            id: telephoneInputRect
            regEpx: "phoneNumber"
            leftIcon: LoginScript.fontello.phone
            placeHolderText: "Phone number"
            Layout.fillWidth: true
            Layout.margins: 8
        }
        SyTextField{
            id: emailInputRect
            placeHolderText: "Enter email address"
            leftIcon: LoginScript.fontello.email
            Layout.fillWidth: true
            Layout.margins: 8
        }
        SyTextField{
            id: createPassword
            placeHolderText: "Create password"
            leftIcon: LoginScript.fontello.lock
            rightIcon: LoginScript.fontello.eye
            Layout.fillWidth: true
            Layout.margins: 8
        }
        SyTextField{
            id: confirmPassword
            placeHolderText: "Confirm password"
            leftIcon: LoginScript.fontello.lock
            rightIcon: LoginScript.fontello.eye
            Layout.fillWidth: true
            Layout.margins: 8
        }
        SyButton{
            id: registertn
            actionName: "Register"
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.margins: 40
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    busyLoader.visible = true
                    appLoader.setSource(LoginScript.pages.login)
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
                onClicked: appLoader.setSource(LoginScript.pages.loginForm)
            }
        }
        SignupOptions{
            id: signupOptions
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
        }
    }
}

