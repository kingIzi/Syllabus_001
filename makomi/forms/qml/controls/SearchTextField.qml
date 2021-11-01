import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import SyLib 1.0

TextField{
    id: inputField
    property alias sySuggestionsTextInput: inputField
    font: Constants.constantsFonts.primaryFont
    implicitWidth: 300
    implicitHeight: 50
    maximumLength: 50
    onAccepted: {
        inputField.focus = false
    }
    onFocusChanged: {
        if (inputField.focus){
            suggestionsBox.visible = true
        }
        else{
            suggestionsBox.visible = false
        }
    }
    ListModel {
        id: suggestions
        ListElement { name: "Math & Physics" }
        ListElement { name: "Chemistry" }
        ListElement { name: "Biology" }
        ListElement { name: "Physics" }
        ListElement { name: "English Literature" }
    }
    SearchBox {
        id: suggestionsBox
        model: suggestions
        width: 200
        anchors.top: inputField.bottom
        anchors.left: inputField.left
        anchors.right: inputField.right
        filter: inputField.text
        property: "name"
        Connections{
            target: suggestionsBox
            function onItemSelected(item){
                inputField.text = item
                inputField.accepted()
            }
        }
    }
}
