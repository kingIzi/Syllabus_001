import QtQuick 2.15
import QtQuick.Layouts 1.15


Item{
    id: upcomingSyllabus
    implicitHeight: upcomingSyllabusGrid.implicitHeight
    implicitWidth: upcomingSyllabusGrid.implicitWidth
    property var syllabusModel: undefined
    property alias counts: upcomingSyllabusGrid.children
    GridLayout{
        id: upcomingSyllabusGrid
        anchors.fill: parent
        readonly property int elementWidth: 130
        columns: Math.max(Math.floor(parent.width / elementWidth), 1)
        rows: Math.max(Math.ceil(children.length / columns), 1)
        Repeater{
            model: syllabusModel
            delegate: Syllabus{
                id: syllabus
                Layout.fillWidth: true
                posterData: (index % 2 === 0) ? "qrc:/images/scienceBook.jpg" : "qrc:/images/syllabusCover-converted-1.png"
                Connections{
                    target: syllabus
                    function onView(){
                        navigationBar.currentStack.push(syllabus.viewComponent)
                    }
                    function onRead(){
                        navigationBar.currentStack.push(syllabus.readComponent)
                    }
                }
            }
        }
    }
}
