import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import CSyllabusV110 1.0

SwipeView{
    id: sySwipeView
    anchors.fill: parent
    Pane{
        Material.elevation: 1
        Material.background: "#333"
        Rectangle{
            width: 600
            height: 800
            color: "red"
            anchors.centerIn: parent
        }
    }
}
