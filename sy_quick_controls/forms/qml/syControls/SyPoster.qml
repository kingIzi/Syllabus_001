import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0
import "../syComponents"
import "../../imports/syComponentsScripts.js" as SyComponents
import "../../imports/SyConstantScripts.js" as SyConstants

Rectangle{
    id: syPoster
    width: 132
    height: 182
    color: "transparent"
    radius: 10
    layer.enabled: (posterActionHover.hovered) ? true : false
    layer.effect: ElevationEffect{
        elevation: 8
    }
    readonly property ListView lv: ListView.view
    property var posterData: ({})
    signal viewBook(var posterData)
    signal readBook(string stream)
    Image {
        id: syllabBg
        source: SyConstants.images.posterBg
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }
    ColumnLayout{
        id: syPosterLayout
        anchors.fill: parent
        spacing: 10
        property string textColor: (posterActionHover.hovered) ? "white" : "black"
        Text {
            id: text2
            x: 8
            text: qsTr("University of Kinshasa")
            Layout.alignment: Qt.AlignTop
            font: Constants.font
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            Layout.topMargin: 20
            color: parent.textColor

        }
        Text {
            id: text1
            x: 22
            text: qsTr("Civil Engineering")
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            font: Constants.font
            color: parent.textColor
        }
        Text {
            id: text3
            x: 9
            y: 112
            text: qsTr("Cours de construction")
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            font: Constants.font
            color: parent.textColor
        }
        Text {
            id: text4
            x: 43
            y: 75
            text: qsTr("CE29455")
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            font: Constants.font
            color: parent.textColor
        }
        Rectangle {
            id: rectangle1
            x: 43
            y: 134
            width: 40
            height: 40
            color: Constants.backgroundColor
            radius: width / 2
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            Layout.bottomMargin: 10
            Text {
                id: text5
                x: 9
                y: 13
                text: qsTr("2eme Grad")
                width: 40
                font: Constants.font
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                anchors.centerIn: parent
            }
        }
    }
    HoverHandler{
        id: posterActionHover
        enabled: true
    }
}
