import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle{
    id: syBtn
    color: "transparent"
    radius: 30
    border.width: 2
    border.color: "#53d8e8"
    property string actionName: "Sign in"
    SyText{
        id: loginLabel
        text: syBtn.actionName
        font.letterSpacing: 4
        font.bold: true
        font.capitalization: "AllUppercase"
        color: "#fff"
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent
    }
}
