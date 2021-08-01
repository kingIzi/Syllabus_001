import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../"
import "qrc:/forms/imports/registration.js" as LoginScript

Rectangle{
    color: "transparent"
    SyText{
        id: continueWithMsg
        text: qsTr("Or continue with, ")
        anchors.horizontalCenter: parent.horizontalCenter
    }
    RowLayout{
        id: signupOptions
        spacing: 40
        anchors{
            top: continueWithMsg.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        Repeater{
            id: continueWith
            model: [LoginScript.signUpWith.google,LoginScript.signUpWith.facebook,LoginScript.signUpWith.instagram]
            delegate: ToolButton{
                id: signUpWithBtn
                Layout.fillWidth: true
                contentItem: Image {
                    id: signUpWithBtnImage
                    source: modelData
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 40
                    sourceSize.height: 40
                }
                MouseArea{
                    anchors.fill: signUpWithBtn
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        LoginScript.signUpWithIconClicked(signUpWithBtnImage.source.toString())
                    }
                }
            }
        }
    }
}
