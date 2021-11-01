import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import SyLib 1.0

Rectangle {
    id: container
    // --- properties
    property QtObject model: undefined
    property Item delegate
    property alias suggestionsModel: filterItem.model
    property alias filter: filterItem.filter
    property alias property: filterItem.property
    signal itemSelected(variant item)
    // --- behaviours
    z: parent.z + 100
    visible: filter.length > 0 && suggestionsModel.count > 0
    height: (visible) ? popup.implicitHeight : 0
    Behavior on height {
        SpringAnimation { spring: 2; damping: 0.2 }
    }
    // --- defaults
    //color: "gray"
    color: "white"
    radius: 5
    border {
        width: 1
        color: "white"
    }
    layer.enabled: true
    layer.effect: ElevationEffect{
        elevation: 1
    }

    SearchFilter {
        id: filterItem
        sourceModel: container.model
    }
    // --- UI
    Column {
        id: popup
        clip: true
        height: childrenRect.height
        width: parent.width - 6
        anchors.centerIn: parent
        spacing: 4
        property int selectedIndex
        property variant selectedItem: selectedIndex == -1 ? null : model[selectedIndex]
        signal suggestionClicked(variant suggestion)

        opacity: container.visible ? 1.0 : 0
        Behavior on opacity {
            NumberAnimation { }
        }


        Repeater {
            id: repeater
            model: container.suggestionsModel
            delegate: Item {
                id: delegateItem
                property variant suggestion: model
                height: textComponent.height
                width: container.width
                Label {
                    id: textComponent
                    color: "black"
                    text: suggestion.name
                    width: parent.width - 6
                    anchors.horizontalCenter: parent.horizontalCenter
                    font: Constants.constantsFonts.primaryFont
                }
                MouseArea {
                    anchors.fill: parent
                    //onClicked: container.itemSelected(delegateItem.suggestion)
                    onClicked: container.itemSelected(textComponent.text)
                }
            }
        }
    }

}
