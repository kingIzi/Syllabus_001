import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import "qrc:/forms/imports/registration.js" as LoginScript


Rectangle{
    id: syTextFieldRect
    property string placeHolderText: "Username"
    property string leftIcon: ""
    property string rightIcon: LoginScript.fontello.close
    property string regEpx: "emailAddress"
    property alias field: syTextField
    color: "#010708"
    opacity: 0.6
    radius: 50
    border.color: "#53d8e8"
    border.width: 0
    Layout.preferredHeight: 30
    Layout.preferredWidth: 340
    TextField{
        id: syTextField
        anchors.fill: parent
        color: "#fff"
        font.pixelSize: 20
        font.family: "Times New Roman"
        placeholderText: syTextFieldRect.placeHolderText
        leftPadding: syTextFieldRect.leftIcon === "" ? 0 : 34
        rightPadding: 24
        maximumLength: 50
        //validator: RegularExpressionValidator { regularExpression: LoginScript.getTextFieldRegex(inputTextFieldRect.regEpx) }
        background: Rectangle { color: "transparent"}
        echoMode: userIcon.fontCode !== LoginScript.fontello.lock ? "Normal" : "Password"
        onFocusChanged: {
            LoginScript.onSyTextFieldFocusChanged(syTextField,syTextFieldRect)
        }
    }
    SyIcon{
        id: userIcon
        fontCode: syTextFieldRect.leftIcon
        visible: syTextField.text.length === 0 ? true : false
        anchors{
            left: syTextFieldRect.left
            top: syTextFieldRect.top
            verticalCenter: parent.verticalCenter
            leftMargin: 10
        }
        onVisibleChanged: {
            LoginScript.onVisbleChangedToogleTextfieldLeftPadding(userIcon,syTextField)
        }
    }
    SyIcon{
        id: syTextFieldRightIcon
        fontCode: syTextFieldRect.rightIcon
        visible: syTextField.text.length === 0 ? false : true
        anchors{
            right: syTextFieldRect.right
            top: syTextFieldRect.top
            verticalCenter: parent.verticalCenter
            rightMargin: 10
        }
        MouseArea{
            anchors.fill: syTextFieldRightIcon
            onClicked: LoginScript.toggleSyTextFieldRightIcon(syTextFieldRect,syTextField)
        }
    }
    //signals
    function showErrorMessage(message){
        textFieldErrorMsg.text = message
        textFieldErrorMsg.visible = true
    }
    function hideErrorMessage(){
        textFieldErrorMsg.visible = false
    }

}
