import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
//import Qt5Compat.GraphicalEffects

Rectangle{
    id: formBackground
    layer.enabled: false
    layer.effect: ElevationEffect{
        elevation: 4
    }
    //color: "#F3F5F9"
    color: "transparent"
    border.width: 0.8; border.color: "#50000000"
    anchors.fill: parent
    anchors.rightMargin: 8
    anchors.leftMargin: 8
    anchors.bottomMargin: 8
    anchors.topMargin: 8
}
