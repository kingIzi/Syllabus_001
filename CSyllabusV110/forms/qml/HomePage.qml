import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import CSyllabusV110 1.0
import "components/syControls"
import "./components"

Page {
    id: homePage
    property alias homeStackView: mStack
    width: Constants.width
    height: Constants.height
    Material.background: "transparent"
    header: SyHeader{
        id: syHeader
        visible: (mStack.children.length > 1) ? false : true
        headerText: "Home"
    }
    contentItem: StackView{
        id: mStack
        initialItem: SyHomeForm{}
    }
    Component.onCompleted: {
        root.showNavBar = true
    }
}

