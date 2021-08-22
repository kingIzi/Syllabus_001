import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QT5csyllabus 1.0
import "../../imports/SyComponentsScripts.js" as SyComponents

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
        source: "../../images/art-math.png"
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
        }
    }
}

