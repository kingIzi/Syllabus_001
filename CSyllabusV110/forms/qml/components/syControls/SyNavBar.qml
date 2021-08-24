import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0
import "../../../imports/syComponentsScripts.js" as SyComponents
import "../../../imports/syConstantScripts.js" as SyConstants

TabBar{
    id: navBar
    currentIndex: 1
    width: Constants.width
    Material.background: Constants.backgroundColor
    Material.accent: Material.LightBlue
    Repeater{
        model: SyConstants.getNavBarIcons()
        delegate: TabButton{
            text: modelData
            font: Constants.font
            onClicked: {
                SyComponents.updateAppLoader(index)
            }
        }
    }
}
