import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15


Button{
    id: syBtn
    background: Rectangle{
        color: "transparent"
        border.width: 3
        //border.color: "#53d8e8"
        border.color: Material.color(Material.Teal)
        radius: 20
    }
    hoverEnabled: false
    width: 340
    height: 50
    z: 0
    property string actionName: ""
    text: actionName
    contentItem: SyText {
        font.capitalization: "AllUppercase"
        text: syBtn.text
        font.pixelSize: 20
        opacity: enabled ? 1.0 : 0.3
        color: syBtn.hovered ? "lightblue" : "#eee"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}

