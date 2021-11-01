import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../components"
import "qrc:/scripts.js" as Scripts

Page {
    id: favoritesPage
    Component.onCompleted: {
        navigationBar.rightItems = undefined
    }
    onVisibleChanged: {
        navigationBar.rightItems = Scripts.getSideNavIcons()
    }
    ListView{
        id: favoritesListView
        anchors.fill: parent
        model: 4
        delegate: FavoriteSyllabus{
            width: favoritesListView.width
            height: 220
            lastReading: (modelData % 2 == 0) ? "qrc:/images/scienceBook.jpg" : "qrc:/images/syllabusCover-converted-1.png"
        }
    }
}
