import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../"

Page{
    id: studiesSelectionPage
    GuiConstants { id: constants }
    SyInnerBackground{ id: formBackground }
    implicitWidth: constants.width
    implicitHeight: constants.height
    RowLayout{
        id: selectUniversityText
        anchors{
            top: formBackground.top
            left: formBackground.left
            right: formBackground.right
        }
        SyText{
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 36
            padding: 20
            text: "Select your current university"
        }
    }
    ListView{

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:10}
}
##^##*/
