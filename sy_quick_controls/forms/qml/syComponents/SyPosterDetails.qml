import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0
import "../syControls"
import "../../imports/SyConstantScripts.js" as SyConstants

Rectangle{
    id: posterDetails
    width: root.width
    height: root.height
    property var poster: null
    color: "transparent"
    Component{
        id: syRead
        SyReading{}
    }
    Component{
        id: syPublishing
        Rectangle{
            id: publisherPane
            Layout.fillWidth: true
            Layout.preferredHeight: publisherColumn.implicitHeight
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            color: "transparent"
            Column{
                id: publisherColumn
                anchors.fill: parent
                spacing: 8
                Label {
                    id: publishText
                    text: modelData.label
                    font: Constants.font
                }
                Label {
                    id: publisherName
                    text: modelData.publisher
                    font: Constants.font
                    color: Material.color(Material.LightBlue,Material.Shade700)
                }
                Rectangle{
                    id: line
                    color: Material.color(Material.Grey,Material.Shade300)
                    width: parent.width
                    height: 0.8
                }
            }
        }
    }
    SyHeader{
        id: posterHeading
        headerText: "View book"
        leftIcon: SyConstants.fontello.left
        height: 70
        anchors{
            top: posterDetails.top
            left: posterDetails.left
            right: posterDetails.right
        }
    }
    Flickable{
        id: detailsFlickable
        anchors{
            top: posterHeading.bottom
            left: parent.left
            right: parent.right
        }
        contentHeight: detailsItems.implicitHeight
        ColumnLayout{
            id: detailsItems
            anchors.fill: parent
            RowLayout{
                id: posterBanner
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                SyPoster{
                    id: viewing
                    Layout.leftMargin: 10
                    Layout.alignment: Qt.AlignVCenter
                    Connections{
                        target: viewing
                        function onReadBook(stream){
                            syHomeStack.push(syRead)
                        }
                    }
                    MouseArea{
                        anchors.fill: viewing
                        onClicked: viewing.readBook("hfigl")
                    }
                }
                ColumnLayout{
                    id: syllabDetails
                    spacing: 8
                    Label {
                        id: authorName
                        text: "Author's full name"
                        font: Constants.font
                        color: Material.color(Material.Grey,Material.Shade500)
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                    }
                    Label {
                        id: subject
                        text: "Math & Physics"
                        font: Constants.font
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                    }
                    Label {
                        id: syllabusName
                        text: "Syllabus name"
                        font: Constants.largeFont2
                        color: "black"
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                    }
                    RowLayout{
                        id: ratings
                        Layout.fillWidth: true
                        spacing: 4
                        Repeater{
                            model: 5
                            delegate: IconLabel{
                                text: SyConstants.fontello.star
                                color: Material.color(Material.Yellow,Material.Shade500)
                                font: Constants.largeFont
                            }
                        }
                    }
                }
            }
            RowLayout{
                id: posterActions
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                readonly property var model: ["Read","Save","Rate"]
                Repeater{
                    model: posterActions.model
                    delegate: SyButton{
                        text: modelData
                        Layout.fillWidth: true
                        font: Constants.font
                        onClicked: {
                            if (modelData === "Read"){
                                viewing.readBook("hie")
                            }
                        }
                    }
                }
            }
            Label {
                id: chaptersLabel
                text: qsTr("Summary")
                font: Constants.largeFont2
                padding: 10
                Layout.alignment: Qt.AlignHCenter
            }
            RowLayout{
                id: allChapters
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                Layout.alignment: Qt.AlignHCenter
                Repeater{
                    model: ["Chapter 1","Chapter 2","Chapter 3","Chaper 4","Chapter 5"]
                    delegate: Label{
                        text: modelData
                        Layout.fillWidth: true
                        font: Constants.font
                        color: (chapterHover.hovered) ? Material.color(Material.LightBlue) : "black"
                        horizontalAlignment: Text.AlignHCenter
                        HoverHandler{
                            id: chapterHover
                            enabled: true
                        }
                    }
                }
            }
            Text {
                id: description
                text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat")
                font: Constants.font
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                horizontalAlignment: Text.AlignHCenter
                Layout.bottomMargin: 20
            }
            Repeater{
                model: [{"label":"Publisher","publisher":"University of Kinshasa"},{"label":"Language","publisher":"English"}]
                delegate: syPublishing
            }
        }
    }
}

