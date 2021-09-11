import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0
import "../../imports/SyConstantScripts.js" as SyConstants
import "../syControls"

Rectangle {
    id: backgroundRect
    width: root.width
    height: 300
    color: "transparent"
    Rectangle{
        id: collectionsContainer
        width: parent.width
        height: parent.height
        anchors.fill: parent
        anchors.margins: 8
        color: Material.color(Material.Teal,Material.Shade300)
        radius: 20
    }
    Image {
        id: collectionsSymbolImg
        source: SyConstants.images.topPicks
        anchors.fill: collectionsContainer
        anchors.margins: 20
        opacity: 0.1
    }
    ColumnLayout{
        id: collectionsColumn
        anchors.fill: collectionsContainer
        spacing: 0
        Text {
            id: collectionsSubject
            text: qsTr("Mathematics")
            font: Constants.headerFont
            color: "white"
            Layout.topMargin: 12
            Layout.leftMargin: 12
            Layout.bottomMargin: 0
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
        }
        Text {
            id: collectionsText
            text: qsTr("Your top syllabus picks!")
            font: Constants.largeFont
            color: "white"
            Layout.fillWidth: true
            Layout.leftMargin: 12
            Layout.bottomMargin: 0
        }
        SyPosterListView{
            id: topCollections
            Layout.fillWidth: true
            Layout.leftMargin: 14
            Layout.rightMargin: 14
            Layout.topMargin: 14
            Layout.bottomMargin: 0
            delegate: SyPoster{
                id: poster
                Connections{
                    target: poster
                    function onReadBook(stream){
                        syHomeStack.push(syRead)
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        poster.readBook()
                    }
                }
            }
        }
    }
}
