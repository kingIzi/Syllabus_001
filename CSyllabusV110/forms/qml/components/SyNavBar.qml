import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "qrc:/forms/imports/syConstants.js" as SyConstants


ToolBar{
    id: syNavBar
    Material.primary: Material.Teal
    RowLayout{
        anchors.fill: parent
        spacing: 0
        Repeater{
            id: indexes
            model: SyConstants.getSyNavBarModel()
            delegate: ToolButton{
                id: syNavItem
                width: syNavBar.width / 3; height: 50
                implicitWidth: syNavItem.width; implicitHeight: syNavItem.height
                icon.source: modelData
                icon.color: "black"
            }
        }
    }
}


