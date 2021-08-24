import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0
import "./syControls"
import "../../imports/syComponentsScripts.js" as SyComponents

Flickable{
    id: flickHomeItems
    contentHeight: homeItems.implicitHeight
    Column{
        id: homeItems
        spacing: 12
        anchors.fill: parent
        SyTopCollectionsPane{
            id: topCollections
        }
        SySubjectsModules{
            id: subjectModules
        }
        SyCoursesSyllabus{
            id: coursesSyllabus
            subject: "English Grammar"
            viewAll: "View All"
        }
        SyCoursesSyllabus{
            id: coursesSyllabus2
            subject: "Chemistry"
            viewAll: "View All"
        }
        SyCopyRightMsg{}
    }
}
