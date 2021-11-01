import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../components"

Page{
    id: subjectsPage
    contentItem: ScrollView{
        id: subjectScroll
        anchors.fill: parent
        contentWidth: availableWidth
        ListView{
            id: allSubjectsListView
            anchors{
                fill: parent
                rightMargin: 8
                leftMargin: 8
            }
            spacing: 20
            orientation: ListView.Vertical
            model: ["Computer Science","Software Engineering","Service Centric & Cloud Computing","Machine Learning","Applied Mathematics","Chemistry","Biology"]
            delegate: BookHorizontalList{
                nowShowing: modelData
                canSelect: true
                model: 14
            }
        }
    }
}

