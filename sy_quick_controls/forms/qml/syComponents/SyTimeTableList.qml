import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Syllabus10 1.0
import Schedule 1.0


ListView{
    id: listOfDaysListView
    property var daysOfWeek
    orientation: ListView.Horizontal
    highlightFollowsCurrentItem: true
    model: listOfDaysListView.daysOfWeek
    delegate: ItemDelegate{
        text: modelData
        width: listOfDaysListView.width / listOfDaysListView.daysOfWeek.length
        height: listOfDaysListView.height
        onClicked: listOfDaysListView.currentIndex = index
    }
}




