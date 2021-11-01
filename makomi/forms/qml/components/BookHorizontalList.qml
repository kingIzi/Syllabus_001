import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../"
import "../pages"


Rectangle{
    id: bookListViewContainer
    width: root.width
    height: implicitHeight
    color: "#fff"
    property string nowShowing: "Recent"
    property bool canSelect: true
    property variant model: undefined
    implicitHeight: recentColumn.implicitHeight
    implicitWidth: recentColumn.implicitWidth
    Component{
        id: subjectGrid
        SearchResultsPage{
            showing: nowShowing
            syllabusModel: bookListViewContainer.model
        }
    }
    ColumnLayout{
        id: recentColumn
        anchors.fill: parent
        height: implicitHeight
        ItemDelegate{
            id: listContainerHeader
            Layout.fillWidth: true
            implicitHeight: listContainerHeaderRow.implicitHeight
            Layout.alignment: Qt.AlignTop
            onClicked: {
                if (bookListViewContainer.canSelect){
                    navigationBar.currentStack.push(subjectGrid)
                }
            }
            RowLayout{
                id: listContainerHeaderRow
                anchors.fill: parent
                Label{
                    id: headerLabel
                    text: nowShowing
                    font: Constants.constantsFonts.secondaryFont
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                    Layout.leftMargin: 8
                    Layout.fillWidth: true
                    wrapMode: "WordWrap"
                    padding: 12
                }
                RowLayout{
                    id: rightLabelRow
                    Layout.alignment: Qt.AlignRight
                    visible: canSelect
                    Layout.rightMargin: 8
                    layoutDirection: Qt.RightToLeft
                    IconImage{
                        source: Constants.icons.navigateNext
                        sourceSize.height: 30
                        sourceSize.width: 30
                        Layout.alignment: Qt.AlignVCenter
                    }
                    Label{
                        text: "View All"
                        font: Constants.constantsFonts.secondaryFont
                        Layout.alignment: Qt.AlignVCenter
                        color: Material.color(Material.LightBlue)
                    }
                }
            }
            DivisorLine{
                anchors.bottom: listContainerHeader.bottom
            }
        }
        Item{
            id: bookListViewItem
            Layout.fillWidth: true
            property int propertyListViewHeight: 0
            implicitHeight: propertyListViewHeight
            ScrollView{
                id: bookListViewScroll
                anchors.fill: parent
                contentWidth: availableWidth
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                ListView{
                    id: bookListView
                    orientation: ListView.Horizontal
                    spacing: 4
                    model: bookListViewContainer.model
                    delegate: Syllabus{
                        id: syllabus
                        Component.onCompleted: {
                            if (syllabus.height > bookListViewItem.propertyListViewHeight){
                                bookListViewItem.propertyListViewHeight = syllabus.height
                            }
                        }
                        posterData: (modelData % 2 === 0) ? "qrc:/images/syllabusCover-converted-1.png" :  "qrc:/images/scienceBook.jpg";
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
    }
}



