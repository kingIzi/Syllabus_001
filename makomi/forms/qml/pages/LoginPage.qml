import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.5
import SyLib 1.0

Page{
    id: loginPage
    header: Rectangle{
        width: parent.width
        height: 56
        color: "#efd2c9"
        RowLayout{
            id: banner
            width: 141
            height: 32
            x: 203
            y: 45
            spacing: 4
            anchors{
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            Frame{
                background: Rectangle{
                    color: "transparent"
                    Rectangle{
                        id: rect1
                        width: 12.73;
                        height: 12.73
                        rotation: 45
                        z: 1
                        y: 6
                        x: 6
                        color: "#08456A"
                    }
                    Rectangle{
                        id: rect2
                        width: 17;
                        height: 17
                        y: 4
                        x: 4
                        rotation: 45
                        color: "#3A92C7"
                    }
                }
            }
            Label {
                id: logoLetter
                text: qsTr("MAKOMI")
                font: Constants.constantsFonts.secondaryFont
                color: "#b64848"
            }
        }
    }
    Flickable{
        id: flickable
        anchors.fill: parent
        contentWidth: availableWidth
        contentHeight: loginForm.implicitHeight + loginPage.header.height
        ColumnLayout{
            id: loginForm
            signal successfullLogin(string username,string password)
            signal clickHereClicked()
            height: implicitHeight
            width: root.width
            Connections{
                target: loginForm
                function onSuccessfullLogin(username,password){
                    console.log(username,password)
                    appLoader.sourceComponent = home
                }
            }
            spacing: 20
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 20
            }
            Label {
                id: signInPromptText
                text: qsTr("Please, login")
                font: Constants.constantsFonts.secondaryFont
                Layout.alignment: Qt.AlignHCenter
            }
            Label {
                id: emailAddressText
                text: qsTr("Email Address")
                font: Constants.constantsFonts.secondaryFont
                Layout.topMargin: 20
            }
            TextField{
                id: username
                Layout.fillWidth: true
                placeholderText: "Email Address"
                font: Constants.constantsFonts.primaryFont
                Material.accent: Material.Blue
                validator: RegularExpressionValidator { regularExpression: Constants.regex.emailAddress }
            }
            Label {
                id: passwordText
                text: qsTr("Password")
                font: Constants.constantsFonts.secondaryFont
            }
            TextField{
                id: password
                Layout.fillWidth: true
                placeholderText: "Password"
                echoMode: "Password"
                Material.accent: Material.Blue
                font: Constants.constantsFonts.primaryFont
            }
            Label {
                id: loginErrorMsg
                text: qsTr("The username or password you entered is incorrect. Please try again...")
                font: Constants.constantsFonts.primaryFont
                color: "#CE4031"
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: 8
                Layout.fillWidth: true
                wrapMode: "WordWrap"
            }
            Label {
                id: forgotPassword
                text: qsTr("Forgot your password?")
                font: Constants.constantsFonts.primaryFont
                color: "black"
                MouseArea{
                    id: mouse
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                }
            }
            Button{
                id: loginAction
                text: "SIGN IN"
                font: Constants.constantsFonts.secondaryFont
                Material.background: Material.color(Material.Blue,Material.Shade900)
                Material.foreground: "#fff"
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                onClicked: {
                    loginForm.successfullLogin(username.text,password.text)
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
                Label {
                    text: qsTr("OR")
                    font: Constants.constantsFonts.secondaryFont
                }
                Rectangle{
                    Layout.preferredHeight: 1
                    color: Material.color(Material.Grey)
                    Layout.fillWidth: true
                }
            }
            RowLayout{
                id: signUpLink
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 8
                Label {
                    text: qsTr("Dont have an account?")
                    font: Constants.constantsFonts.primaryFont
                    color: "black"
                }
                Label {
                    text: qsTr("Click here")
                    font.family: Constants.constantsFonts.primaryFont.family
                    font.underline: (hover.hovered) ? true : false
                    color: Material.color(Material.LightBlue)
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: {
                            loginForm.clickHereClicked()
                        }
                        HoverHandler{
                            id: hover
                            enabled: true
                        }
                    }
                }
            }
        }
    }
}
