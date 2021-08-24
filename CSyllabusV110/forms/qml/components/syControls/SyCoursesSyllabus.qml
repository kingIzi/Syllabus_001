import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0

Rectangle{
    id: syllabusCourses
    width: parent.width
    height: 230
    color: "transparent"
    property string subject: ""
    property string viewAll: ""
    property var syllabusListModel: null
    Text {
        id: subject
        text: syllabusCourses.subject
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
        text: syllabusCourses.viewAll
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
        delegate: SyPoster{
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    parent.openBook("qrc:/forms/qml/components/SyPosterDetails.qml")
                }
            }
        }
    }
}
