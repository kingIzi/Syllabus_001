import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../"
import "../pages"
import "qrc:/scripts.js" as Scripts

Item{
    id: subjectsSaved
    implicitHeight: subjectModuleOptionsRow.implicitHeight
    implicitWidth: subjectModuleOptionsRow.implicitWidth
    Component{
        id: allSubjects
        SubjectsPage{}
    }
    RowLayout{
        id: subjectModuleOptionsRow
        anchors.fill: parent
        Repeater{
            id: subjectModuleRepeater
            model: [{"label": "All Subjects","icon":Constants.icons.localLibrary},{"label": "Favorites","icon":Constants.icons.favorite}]
            delegate: Rectangle{
                id: subjectModuleRect
                color: "white"
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                radius: 30
                RowLayout{
                    anchors.centerIn: parent
                    spacing: 0
                    IconImage{
                        source: modelData.icon
                        sourceSize.height: 30
                        sourceSize.width: 30
                    }
                    Label{
                        text: modelData.label
                        Layout.fillWidth: true
                        Layout.leftMargin: 10
                        font: Constants.constantsFonts.primaryFont
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        const isSubjectClick = subjectModuleRect === subjectModuleRepeater.itemAt(0)
                        if (isSubjectClick){
                            navigationBar.currentStack.push(allSubjects)
                        }
                        else{
                            Scripts.onSideNavItemClicked(appLoader,SideNavDrawer.Navigations.Favorites,SideNavDrawer.Navigations)
                        }
                    }
                }
            }
        }
    }
}
