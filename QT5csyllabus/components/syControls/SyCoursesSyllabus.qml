import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QT5csyllabus 1.0

Rectangle{
    width: parent.width
    height: 230
    color: "transparent"
    Text {
        id: subject
        text: qsTr("English Grammar")
        font: Constants.largeFont
        anchors{
            left: parent.left
            top: parent.top
            topMargin: 4
            leftMargin: 8
        }
    }
    Text {
        id: viewAll
        text: "View all"
        font: Constants.largeFont
        color: Material.color(Material.LightBlue)
        anchors{
            top: parent.top
            right: parent.right
            rightMargin: 8
            topMargin: 4
        }
        MouseArea{
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
        }
    }
    SyPosterListView{
        anchors{
            top: viewAll.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: 8
            rightMargin: 8
            leftMargin: 8
        }
    }
}
