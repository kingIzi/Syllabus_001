import QtQuick 2.15
import Qt5Compat.GraphicalEffects

Rectangle{
    id: formBackground
    GuiConstants { id: constants }
    color:"#30000000"
    border.width: 1; border.color: "#50000000"
    anchors.fill: parent
    anchors.rightMargin: 8
    anchors.leftMargin: 8
    anchors.bottomMargin: 8
    anchors.topMargin: 8
    DropShadow {
        anchors.fill: formBackground
        horizontalOffset: 0
        verticalOffset: 0
        radius: 2.0
        color: "#50000000"
        source: formBackground
    }
}
