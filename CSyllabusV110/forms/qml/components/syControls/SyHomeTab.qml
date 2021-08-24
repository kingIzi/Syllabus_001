import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Material.impl 2.15
import CSyllabusV110 1.0
import "../../../imports/syComponentsScripts.js" as SyComponents


Rectangle{
    id: homeTab
    width: 300
    height: 20
    radius: 8
    color: Material.color(Material.Grey,Material.Shade300)
    property int currentIndex: optionsListView.currentIndex
    Component{
        id: options
        Rectangle{
            readonly property ListView lv: ListView.view
            color: "transparent"
            implicitHeight: 20
            width: homeTab.width / 3
            Text {
                id: itemText
                text: modelData
                font: Constants.font
                color: index === lv.currentIndex ? "#1c9be3" : "black"
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: lv.currentIndex = index
            }
        }
    }
    ListView{
        id: optionsListView
        width: parent.width
        height: parent.height
        model: SyComponents.getHomeViewOptions()
        delegate: options
        clip: true
        orientation: ListView.Horizontal
        onCurrentIndexChanged: homeTab.currentIndex = currentIndex
        highlight: Pane{
            background: Rectangle{
                color: "#fff"
                radius: homeTab.radius / 2
                layer.enabled: true
                layer.effect: ElevationEffect{
                    elevation: 12
                }
            }
        }
    }
}

