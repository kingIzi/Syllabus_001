import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0
import "./syControls"
import "../../imports/syConstantScripts.js" as SyConstants


Page{
    id: registerPage
    width: parent.width
    height: parent.height
    implicitHeight: formBackground.implicitHeight
    implicitWidth: formBackground.implicitWidth
    background: Rectangle { color: "#fff" }
    SyInnerBackground{ id: formBackground; }
    SyText{
        id: welcomeMsg
        text: "Please register"
        font: Constants.headerFont
        wrapMode: Text.WordWrap
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        padding: 32
        color: "black"
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
            leftIcon: SyConstants.fontello.mail
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
        Button{
            id: loginAction
            text: "Register"
            font: Constants.largeFont
            Material.background: Material.LightBlue
            Material.foreground: "#fff"
            Layout.fillWidth: true
            Layout.topMargin: 40
            Layout.leftMargin: 40; Layout.rightMargin: 40
            onClicked: {
                busyLoader.visible = true
                const page = Qt.createComponent("qrc:/forms/qml/components/SyStudiesSelection.qml",registerPage)
                const pageObject = page.createObject(registerPage,{})
                loginStackView.push(pageObject)
            }
        }
        SyText{
            id: loginText
            text: qsTr("Login now.")
            color: Material.color(Material.LightBlue,Material.Shade500)
            font.family: Constants.font.family
            font.underline: (textHover.hovered) ? true : false
            Layout.fillWidth: true
            Layout.topMargin: 20
            horizontalAlignment: Text.AlignHCenter
            MouseArea{
                anchors.fill: loginText
                onClicked: loginStackView.pop()
                HoverHandler{
                    id: textHover
                    enabled: true
                }
            }
        }
        Button{
            id: signUpWithApple
            text: "Sign in with apple"
            font: Constants.font
            Material.background: "black"
            Material.foreground: "#fff"
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.topMargin: 30
            Layout.preferredHeight: 56

            Image {
                width: 20
                height: 20
                source: "qrc:/forms/images/apple_white.png"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 20
            }
        }
        Button{
            id: signUpWithGoogle
            text: "Sign in with Google"
            font: Constants.font
            Material.background: "#fff"
            Material.foreground: Material.Grey
            Layout.fillWidth: true
            Layout.preferredHeight: 56
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Image {
                width: 20
                height: 20
                source: "qrc:/forms/images/google.png"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 20
            }
        }
    }
}

