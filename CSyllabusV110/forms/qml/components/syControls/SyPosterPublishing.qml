import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0

Rectangle{
    id: publisherPane
    width: parent.width
    height: publisherColumn.implicitHeight
    color: "transparent"
    property string label: "Publisher"
    property string publisher: "University of Kinshasa"
    Column{
        id: publisherColumn
        anchors.fill: parent
        spacing: 8
        Label {
            id: publishText
            text: publisherPane.label
            font: Constants.font
        }
        Label {
            id: publisherName
            text: publisherPane.publisher
            font: Constants.font
            color: Material.color(Material.LightBlue,Material.Shade700)
        }
        Rectangle{
            id: line
            color: Material.color(Material.Grey,Material.Shade300)
            width: parent.width
            height: 0.8
        }
    }
}


