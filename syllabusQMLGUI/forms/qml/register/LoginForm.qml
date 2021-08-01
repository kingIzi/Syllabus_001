import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import "../"
import "qrc:/forms/imports/registration.js" as LoginScript


ColumnLayout{
    id: loginDetails
    spacing: 0
    Layout.maximumHeight: 400
    Layout.preferredHeight: 300
    SyText{
        id: loginMsg
        text: qsTr("Please, login")
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        padding: 12
    }
    SyTextField{
        id: username
        placeHolderText: "Username"
        leftIcon: "\uE803"
        rightIcon: "\uE800"
        Layout.fillWidth: true
        Layout.margins: 20
    }
    SyPasswordField{
        id: password
        Layout.fillWidth: true
        Layout.margins: 20
    }
    SyText{
        id: loginErrorMessage
        text: qsTr("Incorrect username or password. Please try again.")
        color: "#e12c1e"
        font.pixelSize: 16
        wrapMode: Text.WordWrap
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        visible: true
    }
    Rectangle{
        id: forgotPasswordOrSignup
        Layout.fillWidth: true
        Layout.margins: 20
        color: "transparent"
        SyText{
            id: forgottenPassword
            text: qsTr("Forgotten password")
            font.pixelSize: 16
            font.underline: true
            color: "lightblue"
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
                    registerLoader.setSource(LoginScript.pages.registerForm)
                }
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
    SyButton{
        id: loginBtn
        Layout.fillWidth: true
        Layout.preferredHeight: 40
        Layout.margins: 60
        MouseArea{
            anchors.fill: parent
            onClicked: console.log("Login slot")
            cursorShape: "PointingHandCursor"
            hoverEnabled: true
        }
    }
    SignupOptions{
        id: signupOptions
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
    }
}


