import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import SyLib 1.0
import "../components"
import "qrc:/scripts.js"as Scripts

Page{
    id: quotesPage
    contentItem: Item{
        id: quotesContainer
        anchors.fill: parent
        Item{
            id: quotesItemContainer
            width: parent.width
            height: parent.height
            anchors.fill: parent
            anchors.margins: 20
            QuotePanel{
                anchors.fill: parent
                width: 500
                height: 500
            }
        }
    }
}
