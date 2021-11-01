import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import SyLib 1.0

Rectangle{
    id: continueReading
    property string lastReading: "qrc:/images/scienceBook.jpg"
    color: "white"
    layer.enabled: true
    layer.effect: ElevationEffect{
        elevation: 2
    }
    implicitHeight: continueReadingGrid.implicitHeight
    implicitWidth: continueReadingGrid.implicitWidth
    GridLayout{
        id: continueReadingGrid
        columns: 2
        anchors.fill: parent
        Image{
            id: syllabusThumbnail
            source: continueReading.lastReading
            Layout.fillHeight: true
            Layout.preferredWidth: 140
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.column: 0
            Layout.row: 0
            Layout.margins: 8
            fillMode: Image.PreserveAspectFit
        }
        ColumnLayout{
            Layout.column: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            Label{
                id: titleLabel
                text: "Syllabus name"
                color: "black"
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                wrapMode: "WordWrap"
                font: Constants.constantsFonts.secondaryFont
            }
            Label{
                id: authorLabel
                text: "Author name"
                color: Material.color(Material.Grey)
                Layout.fillWidth: true
                wrapMode: "WordWrap"
                font: Constants.constantsFonts.secondaryFont
            }
            GridLayout{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.rightMargin: 8
                readonly property int elementWidth: removeBtn.implicitWidth
                columns: Math.max(Math.floor(parent.width / elementWidth), 1)
                rows: Math.max(Math.ceil(children.length / columns), 1)
                Button{
                    id: readBtn
                    text: "Read"
                    Layout.fillWidth: true
                    font: Constants.constantsFonts.actionFont
                    Material.foreground: "#fff"
                    Material.background: Material.color(Material.Blue,Material.Shade900)
                    Binding{
                        target: readBtn.background
                        property: "radius"
                        value: 20
                    }
                }
                Button{
                    id: removeBtn
                    text: "Remove"
                    Layout.fillWidth: true
                    font: Constants.constantsFonts.actionFont
                    Material.foreground: "#000"
                    Material.background: "transparent"
                    Binding{
                        target: removeBtn.background
                        property: "radius"
                        value: 20
                    }
                    Binding{
                        target: removeBtn.background
                        property: "border.width"
                        value: 2
                    }
                    Binding{
                        target: removeBtn.background
                        property: "border.color"
                        value: Material.color(Material.Red,Material.Shade600)
                    }
                }
            }
        }
    }
}
