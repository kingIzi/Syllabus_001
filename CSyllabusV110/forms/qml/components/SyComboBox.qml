import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ComboBox{
    id: universities
    displayText: universities.currentText
    font.pixelSize: 16
    focus: true
    Material.elevation: 4
    Material.foreground: Material.Teal
    delegate: ItemDelegate{
        width: parent.width
        text: modelData
        font.pixelSize: 14
        Material.foreground: Material.color(Material.Grey,Material.Shade200)
        padding: 10
    }
    background: Rectangle{
        color: "transparent"
    }
    Rectangle{
        height: 1
        width: parent.width
        color: Material.color(Material.Teal)
        anchors{
            right: universities.right; left: universities.left
            bottom: universities.bottom
            leftMargin: 10; rightMargin: 10
        }
    }
}





