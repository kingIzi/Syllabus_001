import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects


Rectangle{
    id: syBtn
    color: "transparent"
    border.width: 3
    border.color: "#53d8e8"
    radius: 30
    height: 40
    z: 0
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
        z: 1
    }
}

