import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "components"
import "qrc:/forms/imports/registration.js" as Register
import "qrc:/forms/imports/syConstants.js" as SyConstants


Page{
    id: registerPage
    width: parent.width
    height: parent.height
    implicitHeight: formBackground.implicitHeight
    implicitWidth: formBackground.implicitWidth
    background: Rectangle { color: "transparent" }
    SyInnerBackground{ id: formBackground; }
    SyText{
        id: welcomeMsg
        text: "Please register"
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
        source: SyConstants.pages.busy
        anchors.fill: registerForm
        visible: false
        active: visible
    }
    ColumnLayout{
        id: registerForm
        anchors{
            top: welcomeMsg.bottom
            left: formBackground.left
            right: formBackground.right
        }
        SyTextField{
            id: telephoneInputRect
            leftIcon: SyConstants.fontello.phone
            Layout.fillWidth: true
            Layout.margins: 8
            validator: RegularExpressionValidator { regularExpression: SyConstants.regex.phoneNumber }
            placeholderText: "Telephone"
            echoMode: TextField.Normal
        }
        SyTextField{
            id: emailInputRect
            leftIcon: SyConstants.fontello.email
            Layout.fillWidth: true
            Layout.margins: 8
            validator: RegularExpressionValidator { regularExpression: SyConstants.regex.emailAddress }
            placeholderText: "Email"
            echoMode: TextField.Normal
        }
        SyTextField{
            id: createPassword
            leftIcon: SyConstants.fontello.lock
            rightIcon: SyConstants.fontello.eye
            Layout.fillWidth: true
            Layout.margins: 8
            placeholderText: "Password"
            echoMode: TextField.Password
        }
        SyTextField{
            id: confirmPassword
            leftIcon: SyConstants.fontello.lock
            rightIcon: SyConstants.fontello.eye
            Layout.fillWidth: true
            Layout.margins: 8
            placeholderText: "Confirm password"
            echoMode: TextField.Password
        }
        SyButton{
            id: registertn
            actionName: "Register"
            Layout.fillWidth: true
            Layout.topMargin: 40
            Layout.leftMargin: 40; Layout.rightMargin: 40
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    busyLoader.visible = true
                    Register.stackPushPage(SyConstants.pages.studiesSelection,registerPage,syStack,{})
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
            Layout.topMargin: 20
            horizontalAlignment: Text.AlignHCenter
            MouseArea{
                anchors.fill: loginText
                onClicked: syStack.pop()
            }
        }
        SignupOptions{
            id: signupOptions
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}

