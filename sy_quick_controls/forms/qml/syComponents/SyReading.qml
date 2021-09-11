import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import Syllabus10 1.0
import Syllabus 1.0
import "../../imports/SyConstantScripts.js" as SyConstants

Page{
    id: syReading
    width: root.width
    height: root.height
    implicitHeight: height
    implicitWidth: width
    Component.onCompleted: {
        root.showNavBar = true
    }
    onVisibleChanged: {
        root.showNavBar = false
    }
    property StackView currentStackView: syHomeStack
    Label{
        id: highlightErrorMsg
        anchors.centerIn: flickableContent
        z: 2
        text: "Select text to highlight"
        visible: false
        font: Constants.largeFont
        color: "white"
        opacity: 0
        background: Rectangle{
            radius: 10
            color: "black"
        }
        NumberAnimation {
            id: highightErrorAnimation
            target: highlightErrorMsg
            property: "opacity"
            from: 0
            to:1
            duration: 500
            onStarted: highlightErrorMsg.visible=true
            onFinished: highightErrorAnimationClose.running = true
            running: false
        }
        NumberAnimation {
            id: highightErrorAnimationClose
            target: highlightErrorMsg
            property: "opacity"
            from: 1
            to:0
            duration: 5000
            onFinished: highlightErrorMsg.visible = false
            running: false
        }
    }
    header: Rectangle {
        id: syHeader
        implicitHeight: syReadHeaderLayout.implicitHeight
        implicitWidth: syReadHeaderLayout.implicitWidth
        color: "white"
        layer.enabled: true
        layer.effect: ElevationEffect{
            elevation: 1
        }
        RowLayout{
            id: syReadHeaderLayout
            anchors.fill: parent
            RoundButton{
                id: backButton
                text: SyConstants.fontello.left
                Material.background: "transparent"
                Layout.margins: 4
                font: Constants.largeFont2
                Material.foreground: "black"
                onClicked: {
                    syReading.currentStackView.pop()
                }
            }
            Label {
                id: syHeaderText
                text: "Name of Syllabus"
                font: Constants.largeFont2
                color: "black"
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
            }
            RoundButton{
                id: highlightButton
                icon.source: SyConstants.images.highlight
                Material.background: "transparent"
                Layout.margins: 4
                font: Constants.largeFont2
                onClicked: {
                    if (contentText.selectedText.length === 0){
                        highightErrorAnimation.running = true
                    }
                    else {
                        syHighlighter.highlightText(contentText.textDocument,contentText.selectionStart,contentText.selectionEnd)
                    }
                }
            }
            RoundButton{
                icon.source: SyConstants.images.dotsVertical
                Material.background: "transparent"
                Layout.margins: 4
                font: Constants.largeFont2
                Material.foreground: "black"
                onClicked: {
                    syReadOptions.popup()
                }
                Menu{
                    id: syReadOptions
                    TextField{
                        id: find
                        z: 2
                        placeholderText: "Find"
                        onEditingFinished: syHighlighter.searchText(contentText.textDocument,find.text)
                        Material.background: "white"
                    }
                }
            }
        }
    }
    Flickable {
        id: flickableContent
        width: parent.width
        height: Math.min(contentHeight, parent.height)
        contentWidth: width
        contentHeight: contentText.implicitHeight
        ScrollBar.vertical: ScrollBar {}
        boundsBehavior: Flickable.StopAtBounds
        anchors.fill: parent
        anchors{
            leftMargin: 8
            rightMargin: 2
        }
        TextArea.flickable: TextArea {
            id: contentText
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc maximus, nulla ut commodo sagittis, sapien dui mattis dui, non pulvinar lorem felis nec erat"
            wrapMode: Text.WordWrap
            readOnly: true
            width: root.width
            font: Constants.largeFont2
            selectByMouse: true
            selectByKeyboard: true
            selectionColor: Material.color(Material.LightBlue,Material.Shade700)
            textFormat: TextArea.RichText
            persistentSelection: true
            SyHighlighter{id: syHighlighter}
        }
    }
}


