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
            Label{
                id: pageCount
                text: "Page 34"
                color: "black"
                Layout.fillWidth: true
                font: Constants.constantsFonts.primaryFont
            }
            Slider{
                Layout.fillWidth: true
                id: pageCountSlider
                from: 1
                value: 34
                to: 100
                enabled: false
                Material.accent: Material.color(Material.Blue,Material.Shade900)
            }
            ActionButton{
                id: readBtn
                text: "resume"
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 10
            }
        }
    }
}
