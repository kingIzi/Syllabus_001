import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import Qt5csyllabus 1.0
import "components/syControls"
import "./imports/SyComponentsScripts.js" as SyComponents

Page {
    id: homePage
    width: Constants.width
    height: Constants.height
    Material.background: "transparent"
    property alias syStackView: syStackViewContainer
    header: SyHeader{
        id: syHeader
    }
    footer: SyNavBar{
        id: navBar
    }
    background: Rectangle{
        color: "#F3F5F9"
    }
    StackView{
        id: syStackViewContainer
        initialItem: HomeItem{}
    }
}
