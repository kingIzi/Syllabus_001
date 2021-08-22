import QtQuick 2.15
import QtQuick.Controls 2.15
import QT5csyllabus 1.0
import "components/syControls"
import "./imports/SyComponentsScripts.js" as SyComponents



Rectangle{
    width: Constants.width
    height: Constants.height
    color: "transparent"
    Flickable{
        anchors.fill: parent
        contentHeight: homeItems.height
        Column{
            id: homeItems
            spacing: 12
            anchors{
                left: parent.left
                right: parent.right
            }
            SyTopCollectionsPane{
                id: topCollections
            }
            SySubjectsModules{
                id: subjectModules
            }
            SyCoursesSyllabus{
                id: coursesSyllabus
            }
            SyCoursesSyllabus{
                id: coursesSyllabus2
            }
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
        }
    }
}
