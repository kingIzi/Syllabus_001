import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import "../components"
import "../"
import "qrc:/scripts.js" as Scripts

Page{
    id: homePage
    Component.onCompleted: {
        navigationBar.rightItems = Scripts.getSearchFilterNavBarRightItems(Constants.icons)
    }
    Flickable{
        id: homeItemsFlickable
        anchors.fill: parent
        contentWidth: availableWidth
        contentHeight: homeItemsColumn.height
        ColumnLayout{
            id: homeItemsColumn
            width: parent.width
            height: implicitHeight
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 8
            }
            spacing: 20
            ResumeReading{
                Layout.fillWidth: true
                Layout.preferredHeight: 220
            }
            SubjectModules{
                Layout.fillWidth: true
                Layout.preferredHeight: 40
            }
            BookHorizontalList{
                Layout.fillWidth: true
                nowShowing: "Most Popular"
                canSelect: false
                model: 14
            }
            Item{
                id: syRecommend
                implicitHeight: syRecommendColumn.implicitHeight + topLabel.implicitHeight
                implicitWidth: syRecommendColumn.implicitWidth
                Layout.fillWidth: true
                property int syllabusModel: 4
                property string syllabusLabel: "Recommended"
                Label{
                    id: topLabel
                    anchors{
                        top: parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                    text: "Upcoming"
                    font: Constants.constantsFonts.secondaryFont
                    bottomPadding: 8
                }
                SyllabusGrid{
                    id: syRecommendColumn
                    anchors.top: topLabel.bottom
                    width: parent.width
                    syllabusModel: 8
                }
            }
            BookHorizontalList{
                Layout.fillWidth: true
                //Layout.preferredHeight: 300
                nowShowing: "Your Top Picks"
                canSelect: false
                model: 14
            }
            CopyRightLabel{
                id: copyrightText
                Layout.fillWidth: true
            }
        }
    }
}
