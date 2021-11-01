import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../components"
import "qrc:/scripts.js" as Scripts

Page{
    id: syllabusDetailsPage
    property var poster: undefined
    FavoriteDrawer{
        id: favoriteDialog
    }

    Flickable{
        id: syllabusDetailsFlickable
        anchors.fill: parent
        contentWidth: availableWidth
        contentHeight: syllabusDetailsColumn.implicitHeight
        ColumnLayout{
            id: syllabusDetailsColumn
            width: parent.width
            height: implicitHeight
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
            }
            spacing: 10
            Rectangle{
                id: posterBannerContainer
                Layout.fillWidth: true
                implicitHeight: posterBanner.implicitHeight
                Layout.margins: 10
                color: "white"
                layer.enabled: true
                radius: 10
                layer.effect: ElevationEffect{
                    elevation: 2
                }
                RowLayout{
                    id: posterBanner
                    anchors.fill: parent
                    Image{
                        source: poster
                        Layout.alignment: Qt.AlignVCenter
                        Layout.margins: 8
                        sourceSize.width: syllabus.dimensionsWidth
                        sourceSize.height: syllabus.dimensionsHeight
                        fillMode: Image.PreserveAspectFit
                        MouseArea{
                            anchors.fill: parent
                            onClicked: syllabus.read()
                        }
                    }
                    ColumnLayout{
                        id: syllabDetails
                        spacing: 20
                        Label {
                            id: authorName
                            text: "Author's full name"
                            Layout.fillWidth: true
                            wrapMode: Label.WordWrap
                            font: Constants.constantsFonts.secondaryFont
                            color: Material.color(Material.Grey,Material.Shade500)
                        }
                        Label {
                            id: subject
                            text: "Math & Physics"
                            Layout.fillWidth: true
                            wrapMode: Label.WordWrap
                            font: Constants.constantsFonts.secondaryFont
                        }
                        Label {
                            id: syllabusName
                            text: "Syllabus name"
                            Layout.fillWidth: true
                            wrapMode: Label.WordWrap
                            font: Constants.constantsFonts.secondaryFont
                        }
                        GridLayout{
                            id: ratings
                            Layout.fillWidth: true
                            rowSpacing: 4
                            columnSpacing: rowSpacing
                            readonly property int elementWidth: 30
                            columns: Math.max(Math.floor(parent.width / elementWidth), 1)
                            rows: Math.max(Math.ceil(children.length / columns), 1)
                            Repeater{
                                model: 5
                                delegate: IconImage{
                                    source: Constants.icons.star
                                    Layout.fillWidth: true
                                    color: Material.color(Material.Yellow)
                                }
                            }
                        }
                    }
                }
            }
            GridLayout{
                id: posterActions
                readonly property int elementWidth: 220
                columns: Math.max(Math.floor(parent.width / elementWidth), 1)
                rows: Math.max(Math.ceil(children.length / columns), 1)
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                Layout.topMargin: 20
                readonly property var model: Scripts.getSyllabusDetailsPageActionLabels()
                Button{
                    id: readBtn
                    text: "Read"
                    Layout.fillWidth: true
                    font: Constants.constantsFonts.actionFont
                    Material.foreground: "#fff"
                    Material.background: Material.color(Material.Blue,Material.Shade900)
                    onClicked: syllabus.read()
                    Binding{
                        target: readBtn.background
                        property: "radius"
                        value: 20
                    }
                }
                Button{
                    id: addToFavoriteBtn
                    property bool isFavorite: false
                    text: (isFavorite) ? "Remove From Favorites" : "Add to Favorite"
                    //onIsFavoriteChanged: favoriteDialog.open()
                    onIsFavoriteChanged: {
                        if (isFavorite){
                            favoriteDialog.open()
                        }
                        else {
                        }
                    }
                    Layout.fillWidth: true
                    font: Constants.constantsFonts.actionFont
                    Material.foreground: "#fff"
                    Material.background: Material.color(Material.Blue,Material.Shade900)
                    onClicked: isFavorite = !isFavorite
                    Binding{
                        target: addToFavoriteBtn.background
                        property: "radius"
                        value: 20
                    }
                }
            }
            Label {
                id: chaptersLabel
                text: "Summary"
                topPadding: 20
                Layout.alignment: Qt.AlignHCenter
                font: Constants.constantsFonts.actionFont
            }
            GridLayout{
                id: allChapters
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                readonly property int elementWidth: 120
                columns: Math.max(Math.floor(parent.width / elementWidth), 1)
                rows: Math.max(Math.ceil(children.length / columns), 1)
                Repeater{
                    model: ["Chapter 1","Chapter 2","Chapter 3","Chaper 4","Chapter 5"]
                    delegate: Label{
                        id: chapterLabel
                        text: modelData
                        Layout.fillWidth: true
                        font: Constants.constantsFonts.secondaryFont
                        color: (chapterHover.hovered) ? Material.color(Material.LightBlue) : "black"
                        horizontalAlignment: Label.AlignHCenter
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
                font: Constants.constantsFonts.primaryFont
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                horizontalAlignment: Text.AlignHCenter
            }
            Repeater{
                model: [{"label":"Publisher","publisher":"University of Kinshasa"},{"label":"Language","publisher":"English"}]
                delegate: Rectangle{
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
                            font: Constants.constantsFonts.primaryFont
                        }
                        Label {
                            id: publisherName
                            text: modelData.publisher
                            color: Material.color(Material.LightBlue,Material.Shade700)
                            font: Constants.constantsFonts.primaryFont
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
        }
    }
}



