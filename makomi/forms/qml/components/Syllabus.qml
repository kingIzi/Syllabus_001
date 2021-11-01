import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../pages"

Item{
    id: syllabusContainer
    property alias syllabus: syllabusContainer
    property string posterData
    readonly property int dimensionsWidth: 140
    readonly property int dimensionsHeight: 180
    signal read()
    signal view()
    implicitWidth: rootSySyllabus.implicitWidth
    implicitHeight: rootSySyllabus.implicitHeight
    readonly property Component viewComponent: Component{
        SyllabusDetailsPage{
            poster: posterData
        }
    }
    readonly property Component readComponent: Component{
        ReadingPage{
            book: posterData
        }
    }
    ColumnLayout{
        id: rootSySyllabus
        Item {
            id: imageContainer
            width: dimensionsWidth
            height: dimensionsHeight
            Image{
                id: syllabusPoster
                source: posterData
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
        }
        Item{
            id: details
            implicitHeight: detailsColumn.implicitHeight
            implicitWidth: detailsColumn.implicitWidth
            ColumnLayout{
                id: detailsColumn
                Label{
                    id: titleLabel
                    text: "Syllabus Title"
                    color: "black"
                    Layout.fillWidth: true
                    wrapMode: "WordWrap"
                    padding: 2
                }
                Label{
                    id: authorLabel
                    text: "By " + "Author name"
                    color: Material.color(Material.Grey)
                    Layout.fillWidth: true
                    wrapMode: "WordWrap"
                    padding: 2
                }
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: syllabusContainer.view()
    }
}


