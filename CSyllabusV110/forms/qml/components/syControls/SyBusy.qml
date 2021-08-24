import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../../imports/syConstantScripts.js" as SyConstants


Popup{
    id: busy
    property alias loading: isLoading
    width: parent.width
    height: parent.height
    implicitHeight: parent.implicitHeight
    implicitWidth: parent.implicitWidth
    modal: true
    focus: true
    background: Rectangle { color: "transparent" }
    closePolicy: Popup.CloseOnEscape
    Row{
        spacing: 8
        anchors.centerIn: parent
        SyIcon{
            fontCode: SyConstants.fontello.busy
            color: "#53d8e8"
            font.pixelSize: 30
            NumberAnimation on rotation {
                id: isLoading
                from: 0; to: 360; running: true;
                loops: Animation.Infinite; duration: 1200;
            }
        }
        SyText{
            font.pixelSize: 30
            text: "Loading..."
            color: "#53d8e8"
        }
    }
    //Component.onCompleted: busy.open()
    Component.onDestruction: isLoading.running = false
}
