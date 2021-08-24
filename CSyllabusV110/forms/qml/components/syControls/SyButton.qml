import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import CSyllabusV110 1.0

Button{
    id: syBtn
    hoverEnabled: false
    property bool boreredButton: false
    width: 340
    height: 50
    z: 0
    property string actionName: ""
    text: actionName
    font: Constants.headerFont
    Material.foreground: (!syBtn.boreredButton) ? "black" : "white"
    background: Rectangle{
        radius: 8
        color: (syBtn.boreredButton) ? Material.color(Material.LightBlue) : "transparent"
        border.color: (syBtn.boreredButton) ? "transparent" : Material.color(Material.LightBlue)
        border.width: 2
    }
}

