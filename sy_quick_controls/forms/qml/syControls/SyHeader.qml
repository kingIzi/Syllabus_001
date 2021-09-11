import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0
import "../syComponents"
import "../../imports/SyConstantScripts.js" as SyConstants
import "../../imports/syComponentsScripts.js" as SyComponents



Pane{
    id: syHeader
    Material.background: "white"
    Material.elevation: 1
    width: root.width
    z: 2
    property StackView currentStackView: syHomeStack
    property string headerText: "Home"
    property string leftIcon: SyConstants.fontello.user
    SyProfile{id: profile; z: 2}
    RowLayout{
        anchors.fill: parent
        Loader{
            id: leftIconLoader
            visible: true
            active: visible
            Layout.margins: 8
            sourceComponent: RoundButton{
                text: syHeader.leftIcon
                Material.background: (text === SyConstants.fontello.user) ?  Material.color(Material.Grey,Material.Shade400) : "transparent"
                font: Constants.largeFont2
                Material.foreground: (text === SyConstants.fontello.user) ? "white" : "black"
                onClicked: {
                    SyComponents.onHeaderLeftIconClicked((text === SyConstants.fontello.user),syHeader.currentStackView,profile)
                }
            }
        }
        Text {
            id: syHeaderText
            text: syHeader.headerText
            font: Constants.largeFont2
            Layout.margins: 8
            color: "black"
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
        }
        Loader{
            id: rightIconLoader
            visible: (syHeader.leftIcon === SyConstants.fontello.user)
            active: visible
            Layout.margins: 8
            sourceComponent: RoundButton{
                text: SyConstants.fontello.search
                Material.background: Material.color(Material.LightBlue,Material.Shade400)
                font: Constants.largeFont2
                Material.foreground: "white"
            }
        }
    }
}



