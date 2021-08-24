import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0

ComboBox{
    id: universities
    displayText: universities.currentText
    focus: true
    Material.elevation: 4
    Material.foreground: Material.LightBlue
    delegate: ItemDelegate {
        id: name
        text: qsTr(modelData)
        Material.foreground: Material.color(Material.LightBlue)
        font: Constants.font
        width: parent.width
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





