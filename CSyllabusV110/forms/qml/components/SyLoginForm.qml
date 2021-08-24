import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.5
import CSyllabusV110 1.0
import "./syControls"
import "../../imports/syConstantScripts.js" as SyConstants


ColumnLayout{
    id: loginForm
    signal onLoginClicked()
    Text {
        id: signInPromptText
        text: qsTr("Sign in")
        font: Constants.headerFont
    }
    Text {
        id: emailAddressText
        text: qsTr("Email Address")
        font: Constants.font
        Layout.topMargin: 20
    }
    SyTextField{
        id: username
        Layout.fillWidth: true
        leftIcon: SyConstants.fontello.user
        rightIcon: SyConstants.fontello.close
        placeholderText: "Email Address"
        validator: RegularExpressionValidator { regularExpression: SyConstants.regex.emailAddress }
    }
    Text {
        id: passwordText
        text: qsTr("Password")
        font: Constants.font
    }
    SyTextField{
        id: password
        Layout.fillWidth: true
        leftIcon: SyConstants.fontello.lock
        rightIcon: SyConstants.fontello.eye
        placeholderText: "Password"
        echoMode: "Password"
    }
    Text {
        id: loginErrorMsg
        text: qsTr("Username or password is incorrect. Please try again")
        font: Constants.font
        color: "#CE4031"
        Layout.alignment: Qt.AlignHCenter
        Layout.bottomMargin: 8
        visible: false
    }
    Text {
        id: forgotPassword
        text: qsTr("Forgot your password?")
        font: Constants.font
        color: "black"
        MouseArea{
            id: mouse
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
        }
    }
    Button{
        id: loginAction
        text: "Sign in"
        font: Constants.largeFont
        Material.background: Material.LightBlue
        Material.foreground: "#fff"
        Layout.fillWidth: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20
        onClicked: {
            appLoader.setSource("qrc:/forms/qml/HomePage.qml")
        }
    }
    RowLayout{
        id: loginAlternative
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
        Layout.topMargin: 10
        Rectangle{
            Layout.preferredHeight: 1
            color: Material.color(Material.Grey)
            Layout.fillWidth: true
        }
        Text {
            text: qsTr("OR")
            font: Constants.largeFont
        }
        Rectangle{
            Layout.preferredHeight: 1
            color: Material.color(Material.Grey)
            Layout.fillWidth: true
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
    RowLayout{
        id: signUpLink
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
        Layout.topMargin: 8
        Text {
            text: qsTr("Dont have an account?")
            font: Constants.font
            color: "black"
        }
        Text {
            text: qsTr("Click here")
            font.family: Constants.font.family
            font.underline: (hover.hovered) ? true : false
            color: "#007AFF"
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                onClicked: {
                    const page = Qt.createComponent("qrc:/forms/qml/components/SyRegisterForm.qml",loginForm)
                    const pageObject = page.createObject(loginForm,{})
                    loginStackView.push(pageObject)
                }
                HoverHandler{
                    id: hover
                    enabled: true
                }
            }
        }
    }
}
