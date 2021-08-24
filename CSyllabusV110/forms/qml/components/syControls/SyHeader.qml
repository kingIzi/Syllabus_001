import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import CSyllabusV110 1.0
import "../../../imports/syConstantScripts.js" as SyConstants

Pane{
    id: syHeader
    Material.background: "white"
    Material.elevation: 4
    width: parent.width
    height: 70
    property bool navigating: false
    property bool isReading: false
    property StackView currentStack: null
    property string headerText: "Home"
    RowLayout{
        id: homePageHeader
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            margins: 10
        }
        RoundButton{
            Layout.leftMargin: (!syHeader.navigating) ? 12 : 0
            Layout.alignment: Qt.AlignLeft
            text: (!syHeader.navigating) ? SyConstants.fontello.thLarge : SyConstants.fontello.left
            Material.background: (!syHeader.navigating) ? Material.LightBlue : "transparent"
            Material.foreground: (!syHeader.navigating) ? Constants.backgroundColor : "black"
            font: Constants.largeFont
            onClicked: {
                if (syHeader.currentStack != null){
                    syHeader.currentStack.pop()
                }
                else{
                    console.log("Open settings")
                }
            }
        }
        Text {
            id: currentPage
            text: syHeader.headerText
            font: Constants.largeFont
            color: (syHeader.isReading) ? Material.color(Material.LightBlue) : "black"
            Layout.fillWidth: (!syHeader.navigating) ? false : true
            Layout.leftMargin: (!syHeader.navigating) ? 20 : 0
        }
        RoundButton{
            Layout.rightMargin: 12
            Layout.alignment: Qt.AlignRight
            text: SyConstants.fontello.search
            Material.background: Material.LightBlue
            Material.foreground: Constants.backgroundColor
            visible: (!syHeader.navigating) ? true : false
            font: Constants.largeFont
        }
    }
}
