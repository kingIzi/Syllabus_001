import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Syllabus10 1.0
import "../syControls"
import "../../imports/syComponentsScripts.js" as SyComponents


Column{
    id: homeItems
    spacing: 12
    width: root.width
    SyTopPicks{
        id: topCollections
    }
    SySubjectModules{
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
    SyCopyRightMsg{
        id: copyright
    }
}
