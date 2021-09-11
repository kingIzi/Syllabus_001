import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0
import Schedule 1.0
import "../syControls"
import "../../imports/syComponentsScripts.js" as SyComponents


Drawer{
    id: syAddEventDrawer
    height: root.height
    width: root.width
    edge: Qt.LeftEdge
    Material.background: Material.color(Material.Grey,Material.Shade100)
    property SySchedule sySchedule
    Rectangle{
        id: syAddEventHeader
        width: syAddEvent.width
        height: 50
        color: "white"
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
        layer.enabled: true
        layer.effect: ElevationEffect{
            elevation: 1
        }
        RowLayout{
            id: syAddEventHeaderRow
            anchors.fill: syAddEventHeader
            IconLabel{
                id: closeIcon
                text: SyComponents.getFontelloClose()
                font: Constants.largeFont
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.leftMargin: 12
                MouseArea{
                    anchors.fill: parent
                    onClicked: syAddEventDrawer.close()
                }
            }
            TextField{
                id: eventName
                placeholderText: "Title"
                Layout.fillWidth: true
                font: Constants.largeFont
                maximumLength: 50
            }
            Label{
                id: saveLabelBtn
                text: "Save"
                font: Constants.largeFont2
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.rightMargin: 12
                MouseArea{
                    anchors.fill: saveLabelBtn
                    onClicked: {
                        appLoader.sourceComponent = undefined
                        appLoader.source = "qrc:/forms/qml/SyCalendar.qml"
                    }
                }
            }
        }
    }
    SyColorPicker{
        id: syColorPicker
    }
    Repeater{
        id: timePickerRepeater
        model: 2
        delegate: Item{
            id: timePicker
            property string selectedTime: ""
            implicitHeight: syTimePicker.height
            implicitWidth: syTimePicker.width
            anchors.centerIn: parent
            function open(){
                syTimePicker.open()
            }
            SyTimePicker{
                id: syTimePicker
                Connections{
                    target: syTimePicker
                    function onDone(time){
                        console.log(time)
                        timePicker.selectedTime = time
                    }
                }
            }
        }
    }

    Rectangle{
        id: timeContainerRect
        height: 30
        width: syAddEventDrawer.width
        color: Material.color(Material.Grey,Material.Shade500)
        radius: 8
        anchors{
            top: syAddEventHeader.bottom
            left: parent.left
            right: parent.right
            margins: 14
        }
        RowLayout{
            id: timeContainerRow
            anchors.fill: parent
            RowLayout{
                id: startTimeRow
                implicitWidth: timeContainerRect.width / 2
                implicitHeight: timeContainerRect.height
                Layout.leftMargin: 12
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                spacing: 2
                Label{
                    id: startLabel
                    text: "Starts"
                    font: Constants.largeFont2
                    verticalAlignment: "AlignVCenter"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: timePickerRepeater.itemAt(0).open()
                    }
                }
                Label{
                    id: startTime
                    text: "09:00"
                    font: Constants.largeFont
                    verticalAlignment: "AlignVCenter"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: timePickerRepeater.itemAt(0).open()
                    }
                }
            }
            RowLayout{
                id: endTimeRow
                implicitWidth: timeContainerRect.width / 2
                implicitHeight: timeContainerRect.height
                Layout.rightMargin: 12
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                spacing: 2
                Label{
                    id: endLabel
                    text: "Ends"
                    font: Constants.largeFont2
                    verticalAlignment: "AlignVCenter"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: timePickerRepeater.itemAt(1).open()
                    }
                }
                Label{
                    id: endTime
                    text: "10:00"
                    font: Constants.largeFont
                    verticalAlignment: "AlignVCenter"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: timePickerRepeater.itemAt(1).open()
                    }
                }
            }
        }
    }
    Rectangle{
        id: selectColorRect
        height: 30
        width: syAddEventDrawer.width
        color: Material.color(Material.Brown)
        radius: 8
        anchors{
            top: timeContainerRect.bottom
            left: parent.left
            right: parent.right
            margins: 14
        }
        Label {
            id: selectColorText
            text: qsTr("Select Colour")
            font: Constants.largeFont
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: selectColorRect
            onClicked: {
                syColorPicker.open()
            }
        }
    }
    TextArea{
        id: description
        width: parent.width
        wrapMode: TextArea.Wrap
        font: Constants.largeFont2
        placeholderText: qsTr("Description")
        onTextChanged: { if (length > 255) remove(255, length); }
        Material.accent: Material.LightBlue
        anchors{
            top: selectColorRect.bottom
            left: parent.left
            right: parent.right
            margins: 14
        }
    }
    Label {
        text: qsTr("Maximum " + (((255 - description.length))).toString() + " characters")
        font: Constants.font
        anchors{
            top: description.bottom
            right: parent.right
            rightMargin: 14
        }
    }
}




