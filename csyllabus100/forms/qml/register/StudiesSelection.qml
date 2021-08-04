import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "../"
import "qrc:/forms/imports/registration.js" as SyGui

Page{
    id: studiesSelectionPage
    width: parent.width
    height: parent.height
    implicitHeight: formBackground.implicitHeight
    implicitWidth: formBackground.implicitWidth
    background: Rectangle { color: "transparent" }
    SyInnerBackground{ id: formBackground; }
    ColumnLayout{
        id: userPreferencesForm
        spacing: 10
        anchors{
            top: formBackground.top
            left: formBackground.left
            right: formBackground.right
        }
        SyText{
            Layout.fillWidth: true
            Layout.margins: 10
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 36
            text: "Almost done!"
        }
        SyText{
            Layout.fillWidth: true
            Layout.margins: 0
            padding: 10
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 28
            text: "Select your current university"
        }
        RowLayout{
            id: selectUniversityText
            spacing: 0
            Layout.fillWidth: true
            Layout.margins: 10
            ComboBox {
                currentIndex: 0
                Layout.fillWidth: true
                displayText: currentText
                model: ["Select your university","University of Kinshasa", "University of Kinshasa", "University of Kinshasa"]
                font.pixelSize: 20
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:10}
}
##^##*/
