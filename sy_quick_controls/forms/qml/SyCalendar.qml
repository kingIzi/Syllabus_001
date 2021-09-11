import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import Qt5Compat.GraphicalEffects
import Syllabus10 1.0
import Schedule 1.0
import "./syComponents"
import "../imports/syComponentsScripts.js" as SyComponents


Page{
    id: syTimeTable
    width: root.width
    height: root.height
    Material.background: Material.color(Material.Grey,Material.Shade100)
    SySchedule{
        id: sySchedule
    }
    SyAddEvents{id: syAddEvent}
    header: Rectangle{
        id: timeTableHeader
        width: parent.width
        height: 50
        color: "transparent"
        RowLayout{
            id: timeTableHeaderRow
            anchors.fill: parent
            Label{
                id: timetableHeaderLabel
                text: "Timetable"
                font: Constants.largeFont
                verticalAlignment: "AlignVCenter"
                Layout.alignment: Qt.AlignLeft
                Layout.leftMargin: 12
            }
            IconImage{
                property int m_size: timetableHeaderLabel.implicitHeight
                id: timetableHeaderPlusImage
                source: SyComponents.getPlusIconResPath()
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 12
                sourceSize.width: m_size
                sourceSize.height: m_size
                fillMode: "PreserveAspectFit"
                MouseArea{
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        syAddEvent.open()
                    }
                }
            }
        }
    }
    contentItem: Rectangle{
        id: timeTableItem
        width: root.width
        height: syTimeTable.height - navBar.height
        color: "transparent"
        Rectangle{
            id: line
            height: 0.8
            width: timeTableItem.width
            color: Material.color(Material.Grey,Material.Shade300)
            anchors{
                top: timeTableItem.top
                left: timeTableItem.left
                right: timeTableItem.right
            }
        }
        ScrollView{
            id: weekDaysScroll
            width: timeTableItem.width
            height: 30
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff
            anchors{
                top: line.bottom
                left: timeTableItem.left
                right: timeTableItem.right
            }
            TabBar{
                id: daysTabBar
                implicitWidth: weekDaysScroll.width * 1.5
                height: weekDaysScroll.height
                implicitHeight: weekDaysScroll.height
                currentIndex: timetableSwipe.currentIndex
                anchors.fill: parent
                Repeater{
                    model: sySchedule.getDaysOfWeek()
                    delegate: TabButton{
                        text: modelData
                        implicitHeight: weekDaysScroll.height
                    }
                }
            }
        }
        SwipeView{
            id: timetableSwipe
            currentIndex: daysTabBar.currentIndex
            width: timeTableItem.width
            height: timeTableItem.height - (line.height + weekDaysScroll.height)
            anchors{
                top: weekDaysScroll.bottom
                left: timeTableItem.left
                right: timeTableItem.right
            }
            Repeater{
                model: daysTabBar.count
                delegate: SyEvents{}
            }
        }
    }
}



