import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../components"

Page{
    id: subjectSyllabusPage
    property string showing: ""
    property var syllabusModel: undefined
    Flickable{
        anchors.fill: parent
        contentWidth: availableWidth
        contentHeight: subjectSyllabusItem.implicitHeight
        ColumnLayout{
            id: subjectSyllabusItem
            width: root.width
            Label{
                id: topLabel
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                Layout.fillWidth: true
                wrapMode: "WordWrap"
                text: showing
                font: Constants.constantsFonts.secondaryFont
                Layout.leftMargin: 20
                Layout.topMargin: 20
            }
            Label{
                id: resultsCountLabel
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                Layout.fillWidth: true
                wrapMode: "WordWrap"
                text: (subjectSyllabusGrid.counts.length - 1) + " Result(s) found"
                font: Constants.constantsFonts.primaryFont
                Layout.leftMargin: 20
            }
            SyllabusGrid{
                id: subjectSyllabusGrid
                Layout.fillWidth: true
                Layout.margins: 20
                syllabusModel: subjectSyllabusPage.syllabusModel
            }
        }
    }
}
