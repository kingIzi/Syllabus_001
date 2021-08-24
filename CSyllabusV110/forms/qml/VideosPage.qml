import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import CSyllabusV110 1.0
import "components/syControls"
import "./components"
import "../imports/syConstantScripts.js" as SyConstants

Page {
    id: homePage
    width: Constants.width
    height: Constants.height
    Material.background: "transparent"
    header: TabBar{
        id: tabBar
        currentIndex: syHistorySwipe.currentIndex
        Repeater{
            model: ["Videos","Quote"]
            delegate: TabButton{
                text: modelData;
                font: Constants.font
                onClicked: {
                    if (text === "Videos")
                        appLoader.setSource("qrc:/forms/qml/VideosPage.qml")
                }
            }
        }
    }
    SwipeView{
        id: syHistorySwipe
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        StackLayout{
            id: syVideosStackLayout
            currentIndex: 0
            Rectangle{
                id: videosContainer
                width: parent.width
                height: parent.height
                color: "transparent"
                ListView{
                    id: videosListView
                    clip: true
                    model: 20
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10
                    delegate: SyVideoItemDelegate{
                        id: syVid
                        video: modelData
                        Connections{
                            function onVideoPlayBtnClicked(video){
                                mLoader.model = modelData
                                syVideosStackLayout.currentIndex = 1
                            }
                        }
                    }
                }
            }
            Loader{
                id: mLoader
                property var model: null
                visible: true
                active: visible
                sourceComponent: Item {

                }
            }
        }
    }
}

