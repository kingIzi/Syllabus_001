import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import CSyllabusV110 1.0
import "../../../imports/syConstantScripts.js" as SyConstants

Item {
    id: videoItem
    width: videosContainer.width
    height: 300
    property string video: "null"
    signal videoPlayBtnClicked(var video)
    Image {
        id: thumbnail
        anchors.fill: parent
        source: "qrc:/forms/images/video-thumnail.jpg"
        fillMode: Image.PreserveAspectFit
    }
    ColumnLayout{
        anchors.bottom: videoItem.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: 30
        Text {
            text: qsTr("Video Title " + video)
            font: Constants.largeFont
            padding: 10
            color: "#eee"
            Layout.fillWidth: true
            Layout.preferredHeight: 24
        }
        Text {
            Layout.fillWidth: true
            Layout.preferredHeight: 24
            text: SyConstants.fontello.eye + " 834 | 11,223 | lorem ipsum lorem lorem"
            font: Constants.font
            padding: 10
            color: "#eee"
        }
    }
    RoundButton{
        anchors.top: videoItem.top
        anchors.right: videoItem.right
        anchors.margins: 20
        text: SyConstants.fontello.right
        Material.background: Material.LightBlue
        Material.foreground: "white"
        onClicked: {

        }
    }
    Rectangle{
        id: playBtn
        width: videoItem.width / 3
        height: width
        radius: width / 2
        color: "transparent"
        border.color: (playBtnHover.hovered) ? "lightblue" : "white"
        border.width: 3
        anchors.centerIn: videoItem
        IconLabel{
            anchors.fill: parent
            text: "Play"
            font: Constants.largeFont
            color: (playBtnHover.hovered) ? "lightblue" : "white"
        }
        MouseArea{
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
            //onClicked: syVideosStackLayout.currentIndex = 1
            onClicked: videoPlayBtnClicked(video)
            HoverHandler{
                id: playBtnHover
                enabled: true
            }
        }
    }
}
