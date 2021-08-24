import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import CSyllabusV110 1.0
import "./syControls"
import "../../imports/syConstantScripts.js" as SyConstants

Item {
    id: details
    property var poster: null
    SyHeader{
        id: header
        navigating: true
        currentStack: homeStackView
        headerText: "Syllabus"
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
        clip: true
    }
    Flickable{
        contentHeight: detailsItems.implicitHeight
        clip: true
        anchors{
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 8
        }
        Column{
            id: detailsItems
            spacing: 8
            anchors.fill: parent
            Rectangle{
                id: syPosterCard
                width: parent.width
                height: posterDetails.implicitHeight + 30
                color: "transparent"
                radius: 10
                border.color: Material.color(Material.Grey,Material.Shade300)
                border.width: 0.8
                anchors.horizontalCenter: parent.horizontalCenter
                RowLayout{
                    anchors.fill: parent
                    spacing: 8
                    SyPoster{
                        posterData: details.poster
                        Layout.alignment: Qt.AlignLeft
                        Layout.fillHeight: true
                        Layout.margins: 4
                        layer.enabled: true
                        onFf: console.log(123)
                    }
                    Column{
                        id: posterDetails
                        Layout.fillWidth: true
                        Layout.margins: 2
                        spacing: 10
                        Text {
                            text: qsTr("Tresor Mputu Mabi")
                            font: Constants.font
                            width: parent.width
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            text: qsTr("Civil ngineering")
                            font: Constants.largeFont2
                            width: parent.width
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            text: qsTr("Applied Mathematics")
                            font: Constants.largeFont2
                            width: parent.width
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            text: qsTr("Integration by parts")
                            font: Constants.largeFont
                            width: parent.width
                            wrapMode: Text.WordWrap
                        }
                        Row{
                            spacing: 10
                            Repeater{
                                model: 5
                                delegate: IconLabel{
                                    text: SyConstants.fontello.star
                                    color: Material.color(Material.Yellow)
                                    font: Constants.largeFont2
                                }
                            }
                        }
                    }
                }
            }
            Item{
                width: parent.width
                height: 40
                RowLayout{
                    id: posterActions
                    anchors.fill: parent
                    readonly property var model: ["Read","Download","Save","Rate"]
                    Repeater{
                        model: posterActions.model
                        delegate: SyButton{
                            text: modelData
                            Layout.fillWidth: true
                            font: Constants.font
                            onClicked: {
                                if (modelData === posterActions.model[0]){
                                    const page = Qt.createComponent("qrc:/forms/qml/components/SyRead.qml",details)
                                    const pageObject = page.createObject(details,{})
                                    homeStackView.push(pageObject)
                                }
                            }
                        }
                    }
                }
            }
            Label {
                id: chaptersText
                text: qsTr("All chapters")
                font: Constants.largeFont2
                padding: 10
            }
            Item {
                id: allChapters
                width: parent.width
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                RowLayout{
                    anchors.fill: parent
                    Repeater{
                        model: ["Chapter 1","Chapter 2","Chapter 3","Chaper 4","Chapter 5"]
                        delegate: Text{
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
            }
            Label {
                id: summaryText
                text: qsTr("About book")
                font: Constants.largeFont2
                padding: 10
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                id: description
                text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat")
                font: Constants.font
                width: parent.width
                wrapMode: Text.WordWrap
                leftPadding: 10
                rightPadding: 10
                horizontalAlignment: Text.AlignHCenter
            }
            Repeater{
                model: [{"label":"Publisher","publisher":"University of Kinshasa"},{"label":"Language","publisher":"English"}]
                delegate: SyPosterPublishing{
                    label: modelData.label
                    publisher: modelData.publisher
                }
            }
            SyCoursesSyllabus{
                subject: "Similar books"
            }
            SyCopyRightMsg{}
        }
    }
}
