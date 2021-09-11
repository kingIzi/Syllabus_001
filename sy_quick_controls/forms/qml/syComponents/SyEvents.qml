import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0
import "../syComponents"
import "../../imports/syComponentsScripts.js" as SyComponents



Item{
    id: syEvents
    width: timetableSwipe.width
    height: timetableSwipe.height
    Loader{
        id: eventsLoader
        visible: true
        active: visible
        sourceComponent: noEvent
        anchors{
            centerIn: (eventsLoader.sourceComponent === noEvent) ? parent : undefined
            fill: (eventsLoader.sourceComponent === timetableList) ? parent : undefined
        }
    }
    Component{
        id: timetableList
        SyTimeTableList{}
    }

    Component{
        id: noEvent
        ColumnLayout{
            IconImage{
                id: noEventImage
                source: SyComponents.getEventAvailableIcon()
                sourceSize.width: 80
                sourceSize.height: 80
                fillMode: "PreserveAspectFit"
                Layout.alignment: Qt.AlignHCenter
                color: Material.color(Material.LightBlue)
            }
            Label{
                id: noEventLabel
                text: "No Events"
                font: Constants.largeFont
                Layout.alignment: Qt.AlignHCenter
                horizontalAlignment: "AlignHCenter"
                color: Material.color(Material.LightBlue)
            }
        }
    }
}

