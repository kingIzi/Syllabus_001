import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0
import "../../imports/syComponentsScripts.js" as SyComponents

Popup {
    id: rootColorPicker
    width: root.width
    height: root.height
    Material.background: Material.color(Material.Grey,Material.Shade100)
    Page{
        anchors.fill: parent
        Material.background: "transparent"
        header: Rectangle{
            id: syColorPickerHeader
            width: root.width
            height: 50
            color: "white"
            layer.enabled: true
            layer.effect: ElevationEffect{
                elevation: 1
            }
            RowLayout{
                id: syColorPickerHeaderRow
                anchors.fill: syColorPickerHeader
                IconLabel{
                    id: closeIcon
                    text: SyComponents.getFontelloLeft()
                    font: Constants.largeFont
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    Layout.leftMargin: 12
                    MouseArea{
                        anchors.fill: parent
                        onClicked: syColorPicker.close()
                    }
                }
                Label{
                    id: headerLabel
                    text: "Select color"
                    font: Constants.largeFont
                }
            }
        }
        contentItem: ListView{
            id: syEventsColorsListView
            model: SyComponents.getMaterialColorCodesListModel()
            width: root.width
            height: root.height
            orientation: ListView.Vertical
            boundsBehavior: ListView.StopAtBounds
            spacing: 8
            delegate: Item{
                id: colorItemContainer
                width: syEventsColorsListView.width
                height: 40
                RowLayout{
                    id: colorRow
                    anchors.fill: colorItemContainer
                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        radius: 8
                        color: Material.color(modelData,Material.Shade100)
                    }
                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        radius: 8
                        color: Material.color(modelData,Material.Shade500)
                    }
                    Rectangle{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        radius: 8
                        color: Material.color(modelData,Material.Shade900)
                    }
                }
            }
        }
    }
}
