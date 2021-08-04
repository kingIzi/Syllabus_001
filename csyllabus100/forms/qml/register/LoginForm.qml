import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Material 2.15
import "../"
import "qrc:/forms/imports/registration.js" as LoginScript


Page{
    id: loginPage
    width: parent.width
    height: parent.height
    implicitHeight: formBackground.implicitHeight
    implicitWidth: formBackground.implicitWidth
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
        width: parent.width
        PaddedRectangle{ padding: 32 }
        anchors{
            top: welcomeMsg.bottom
            left: parent.left
            right: parent.right
        }
        SyTextField{
            id: username
            placeHolderText: "Username"
            leftIcon: LoginScript.fontello.user
            Layout.fillWidth: true
            Layout.margins: 8
        }
        SyTextField{
            id: password
            placeHolderText: "Password"
            leftIcon: LoginScript.fontello.lock
            rightIcon: LoginScript.fontello.eye
            Layout.fillWidth: true
            Layout.margins: 8
        }
        SyText{
            id: syTextFieldErrorMsg
            color: "#f5737f"
            Layout.fillWidth: true
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            visible: false
        }
        CheckBox{
            id: persistence
            Layout.fillWidth: true
            Layout.margins: 8
            text: "Stay logged in"
            checked: true
            font.pixelSize: 16
            font.family: "Times New Roman"
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
                color: "#53d8e8"
                anchors{
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        appLoader.setSource(LoginScript.pages.registerForm)
                    }
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
        SyButton{
            id: loginBtn
            Layout.fillWidth: true
            Layout.margins: 40
            MouseArea{
                anchors.fill: parent
                onClicked: {

                }
                cursorShape: "PointingHandCursor"
                hoverEnabled: true
            }
        }
        SignupOptions{ id: signUpWith; }
    }
}
