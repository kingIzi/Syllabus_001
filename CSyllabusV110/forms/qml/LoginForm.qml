import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
//import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Material 2.15
import "components"
import "qrc:/forms/imports/registration.js" as Register
import "qrc:/forms/imports/syConstants.js" as SyConstants



Page{
    id: loginPage
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
    ColumnLayout{
        id: loginForm
        spacing: 8
        anchors{
            top: welcomeMsg.bottom
            left: formBackground.left
            right: formBackground.right
        }
        SyTextField{
            id: username
            leftIcon: SyConstants.fontello.user
            Layout.fillWidth: true
            Layout.margins: 8
            validator: RegularExpressionValidator { regularExpression: SyConstants.regex.emailAddress }
            placeholderText: "Username"
            echoMode: TextField.Normal
        }
        SyTextField{
            id: password
            leftIcon: SyConstants.fontello.lock
            rightIcon: SyConstants.fontello.eye
            Layout.fillWidth: true
            Layout.margins: 8
            placeholderText: "Password"
            echoMode: TextField.Password
        }
        SyText{
            id: syTextFieldErrorMsg
            color: "#eee"
            text: "Login error message goes here."
            Layout.fillWidth: true
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            visible: true
        }
        CheckBox{
            id: persistence
            Layout.fillWidth: true
            Layout.margins: 8
            text: "Stay logged in"
            checked: true
            font.pixelSize: 16
            font.family: "Times New Roman"
            Material.accent: Material.Teal
            Material.foreground: Material.Grey
        }
        Rectangle{
            id: forgotPasswordOrSignup
            Layout.fillWidth: true
            Layout.margins: 8
            color: "transparent"
            SyText{
                id: forgottenPassword
                text: qsTr("Forgotten password")
                font.pixelSize: 16
                color: "#53d8e8"
                anchors{
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: console.log("Forgot password slot")
                    cursorShape: Qt.PointingHandCursor
                }
            }
            SyText {
                id: signup
                text: qsTr("Sign up now!")
                font.pixelSize: 16
                color: Material.color(Material.Teal)
                anchors{
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        Register.stackPushPage(SyConstants.pages.registerForm,loginPage,syStack,{})
                    }
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
        SyButton{
            id: loginBtn
            Layout.fillWidth: true
            Layout.margins: 40
            actionName: "Sign in"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    appLoader.sourceComponent = undefined;
                    appLoader.source = SyConstants.pages.homePage
                }
                cursorShape: "PointingHandCursor"
                hoverEnabled: true
            }
        }
        SignupOptions{
            id: signUpWith;
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
