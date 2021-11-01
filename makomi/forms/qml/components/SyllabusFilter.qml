import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import SyLib 1.0
import "../models"

Drawer{
    id: filterDrawer
    edge: Qt.BottomEdge
    width: parent.width
    height: 500
    background: Rectangle{
        id: filterBackgroundRect
        radius: 20
        Rectangle {
          id: squareRect
          color: filterBackgroundRect.color
          height: (filterDrawer.opened) ? filterBackgroundRect.radius : 0
          anchors{
              left: filterBackgroundRect.left
              right: filterBackgroundRect.right
              bottom: filterBackgroundRect.bottom
          }
        }
    }
    contentItem: Item{
        id: filterDrawerItem
        Item{
            id: topItem
            implicitWidth: parent.width
            implicitHeight: (filterLabel.implicitHeight + readBtn.implicitHeight)
            Label{
                id: filterLabel
                text: "Add Filter"
                font: Constants.constantsFonts.secondaryFont
                width: filterDrawerItem.width
                wrapMode: "WordWrap"
                anchors{
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 8
                }
            }
            ActionButton{
                id: readBtn
                anchors{
                    right: parent.right
                    rightMargin: 8
                    verticalCenter: parent.verticalCenter
                }
            }
        }
        DivisorLine{
            id: divisor
            anchors.top: topItem.bottom
        }
        Flickable{
            id: filterFlickable
            clip: true
            anchors{
                top: divisor.bottom
                left: parent.left
                right: parent.right
            }
            width: parent.width
            height: parent.height - (topItem.implicitHeight + divisor.height)
            contentWidth: availableWidth
            contentHeight: filterContent.height
            ColumnLayout{
                id: filterContent
                height: implicitHeight
                anchors{
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
                RowLayout{
                    id: defaultOptions
                    width: parent.width
                    RadioButton{
                        id: selectAllBtn
                        Material.accent: Material.color(Material.Blue,Material.Shade900)
                        text: "Select All"
                        font: Constants.constantsFonts.primaryFont
                        Layout.leftMargin: 8
                        checked: true
                        Layout.alignment: Qt.AlignLeft
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if (selectAllBtn.checked){
                                    selectAllBtn.checked = false
                                }
                                else {
                                    selectAllBtn.checked = true
                                }
                            }
                        }
                    }
                    ComboBox{
                        id: yearsStudyComboBox
                        Layout.alignment: Qt.AlignRight
                        Layout.fillWidth: true
                        displayText: currentText
                        font: Constants.constantsFonts.primaryFont
                        Layout.rightMargin: 8
                        model: YearStudyModel{
                            id: yearsStudyModel
                        }
                        delegate: ItemDelegate{
                            id: yearsStudyDelegate
                            width: yearsStudyComboBox.width
                            text: grade
                            font: Constants.constantsFonts.primaryFont
                            DivisorLine{
                                anchors.top: yearsStudyDelegate.bottom
                                width: yearsStudyDelegate.width
                            }
                        }
                        onCurrentIndexChanged: {
                            yearsStudyComboBox.displayText = yearsStudyModel.get(currentIndex).grade
                        }
                    }
                }
                GridLayout{
                    id: moduleGrid
                    readonly property int elementWidth: 180
                    columns: Math.max(Math.floor(parent.width / elementWidth), 1)
                    rows: Math.max(Math.ceil(children.length / columns), 1)
                    Layout.fillWidth: true
                    enabled: !selectAllBtn.checked
                    Repeater{
                        model: Array.from({length: 20}, (_, index) => index + 1);
                        delegate: Button{
                            id: subjectBtn
                            property bool isClicked: false
                            text: (modelData % 2 === 0) ? "Applied Mathematics" : "Software Engineering"
                            contentItem: Label{
                                text: subjectBtn.text
                                wrapMode: "WordWrap"
                                verticalAlignment: "AlignVCenter"
                            }
                            font: Constants.constantsFonts.primaryFont
                            Layout.fillWidth: true
                            Layout.leftMargin: 8
                            Layout.rightMargin: 8
                            Material.background: (isClicked) ? Material.color(Material.LightBlue) : "transparent"
                            onClicked: isClicked = !isClicked
                            Binding{
                                target: background
                                property: "radius"
                                value: 10
                            }
                            Binding{
                                target: background
                                property: "border.width"
                                value: 1
                            }
                            Binding{
                                target: background
                                property: "border.color"
                                value: "black"
                            }
                        }
                    }
                }
            }
        }
    }
}


