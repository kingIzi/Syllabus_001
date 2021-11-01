import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects
import Qt.labs.platform 1.1
import SyLib 1.0


Rectangle{
    readonly property int containerSize: 150
    property url filePath: ""
    FileDialog {
        id: fileDialog
        onAccepted: {
            filePath = file
        }
    }
    id: photoContainer
    width: containerSize
    height: containerSize
    radius: (containerSize / 2)
    color: Material.color(Material.Grey,Material.Shade300)
    RoundButton{
        id: cameraIcon
        icon.source: Constants.icons.photoCamera
        icon.width: 80
        icon.height: 80
        anchors.centerIn: parent
        width: containerSize
        height: containerSize
        Material.background: "transparent"
        visible: (filePath.toString().length === 0 || containerHover.hovered)
        z: 2
        onClicked: fileDialog.open()
    }
    Image {
        id: img
        source: fileDialog.file
        visible: filePath.toString().length !== 0
        width: containerSize
        height: containerSize
        fillMode: Image.PreserveAspectCrop
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }
    }
    Rectangle {
        id: mask
        width: containerSize
        height: containerSize
        radius: (containerSize / 2)
        visible: false
    }
    HoverHandler{
        id: containerHover
        enabled: filePath.toString().length !== 0
    }
}
