import QtQuick 2.15
import QtQuick.Controls 2.15
import QT5csyllabus 1.0
import "../../imports/SyComponentsScripts.js" as SyComponents


TabBar{
    id: navBar
    currentIndex: 1
    width: Constants.width
    Material.background: Constants.backgroundColor
    Material.accent: Material.LightBlue
    Repeater{
        model: SyComponents.getNavBarIcons()
        delegate: TabButton{
            text: modelData
        }
    }
}
