import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Syllabus10 1.0

Text {
    id: copyright
    text: qsTr("All book publications are school property. Copying and publishing books is prohibited.")
    font: Constants.font
    width: parent.width
    wrapMode: Text.WordWrap
    padding: 20
    horizontalAlignment: Text.AlignHCenter
    Rectangle{
        color: Material.color(Material.Grey,Material.Shade400)
        width: parent.width
        height: 0.8
        anchors.top: parent.top
    }
}
