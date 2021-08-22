import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import QT5csyllabus 1.0
import "../../imports/SyComponentsScripts.js" as SyComponents
import "../../imports/syConstantsScript.js" as SyConstants


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
    function onSyllabusPosterClicked(){
        const detailsPage = SyComponents.createSpriteObjects(SyConstants.syControls.SyPosterDetails)
        syStackView.push(detailsPage)
    }
    Image {
        id: syllabBg
        source: "../../images/poster2_bg.png"
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
    MouseArea{
        id: posterAction
        anchors.fill: parent
        cursorShape: "PointingHandCursor"
        onClicked: {
            lv.currentIndex = index
            syPoster.onSyllabusPosterClicked()
        }

        HoverHandler{
            id: posterActionHover
            enabled: true
        }
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:1.66}
}
##^##*/

