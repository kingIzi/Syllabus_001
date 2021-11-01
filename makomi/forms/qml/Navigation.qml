import QtQuick 2.15
import QtQuick.Controls 2.15
import "pages"

Loader{
    id: appLoader
    readonly property var allNavigations: [home,saved,didYouKnow,myAccount]
    signal navigationChanged(int index)
    visible: true
    active: visible
    anchors.fill: parent
    sourceComponent: login
}
