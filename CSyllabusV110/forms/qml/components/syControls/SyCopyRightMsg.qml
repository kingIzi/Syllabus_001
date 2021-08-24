import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0
import "../../../imports/syComponentsScripts.js" as SyComponents

Text {
    id: copyright
    text: qsTr("All book publications are school property. Copying and publishing books is prohibited.")
    font: Constants.font
    width: parent.width
    wrapMode: Text.WordWrap
    padding: 20
    horizontalAlignment: SyComponents.changeCopyrightHorizontalAlignment(homePage.width)
    Rectangle{
        color: Material.color(Material.Grey,Material.Shade400)
        width: parent.width
        height: 0.8
        anchors.top: parent.top
    }
}
