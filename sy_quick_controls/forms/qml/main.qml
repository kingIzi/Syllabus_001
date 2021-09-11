import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Syllabus10 1.0
import "./syControls"
import "./syComponents"
import "../imports/syComponentsScripts.js" as SyComponents


ApplicationWindow {
    id: root
    width: Constants.width
    height: Constants.height
    property bool isUser: false
    property bool showNavBar: false
    property alias homePage: home
    property alias loginPage: login
    property alias calendarPage: calendar
    property alias loader: appLoader
    visible: true
    title: qsTr("Syllabus")
    Material.theme: Material.Light
    minimumWidth: Constants.width
    footer: TabBar{
        id: navBar
        Material.accent: Material.LightBlue
        implicitWidth: root.width
        currentIndex: 1
        visible: (appLoader.sourceComponent !== login) && (!root.showNavBar)
        onCurrentIndexChanged: SyComponents.switchSyNavBarItem(navBar.currentIndex,root)
        Repeater{
            model: SyComponents.getSyNavBarModel()
            delegate: TabButton{
                id: syNavBarItem
                Layout.fillWidth: true
                icon.source: modelData
                icon.color: (navBar.currentIndex === index) ? Material.color(Material.LightBlue) : "black"
            }
        }
    }
    Component{
        id: home
        SyHomePage{}
    }
    Component{
        id: login
        SyLoginPage{}
    }
    Component{
        id: calendar
        SyCalendar{}
    }
    Loader{
        id: appLoader
        visible: true
        active: visible
        anchors.fill: parent
        sourceComponent: (root.isUser) ? home : login
    }
}
