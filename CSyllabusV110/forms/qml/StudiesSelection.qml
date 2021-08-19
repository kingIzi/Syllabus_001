import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "components"
import "qrc:/forms/imports/registration.js" as Register
import "qrc:/forms/imports/syConstants.js" as SyConstants




Page{
    id: studiesSelectionPage
    width: parent.width
    height: parent.height
    background: SyInnerBackground{}
    Component{
        id: allSubjects
        CoursesSelection{}
    }
    ColumnLayout{
        id: userPreferencesForm
        spacing: 10
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
        SyText{
            Layout.fillWidth: true
            Layout.margins: 20
            font.pixelSize: 36
            text: "Complete the form below to continue."
            font.letterSpacing: 4
            lineHeight: 1
        }
        SyText{
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.bottomMargin: 10
            font.pixelSize: 20
            text: "You are in,"
            font.letterSpacing: 4
        }
        GridLayout{
            id: allGrades
            Layout.fillWidth: true
            Layout.leftMargin: 10; Layout.rightMargin: 10;
            rows: 2
            columns: 4
            clip: true
            Repeater{
                model: ["1er Grad","2eme Grad","3eme Grad","1er Doct","2eme Doct","3eme Doct","4eme Doct"]
                delegate: Button{
                    id: btn
                    property bool isActive: false
                    text: modelData
                    contentItem: SyText{
                        color: Material.color(Material.Grey,Material.Shade100)
                        text: btn.text
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    width: parent.width / 4
                    Layout.fillWidth: true
                    Material.background: (btn.isActive) ? Material.color(Material.Teal,Material.Shade700) : "transparent"
                    onClicked: {
                        Register.selectedGrades(btn,allGrades.children)
                    }
                }
            }
        }
        SyText{
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.bottomMargin: 10
            font.pixelSize: 20
            text: "University & Faculty"
            font.letterSpacing: 4
        }
        SyComboBox{
            id: universities
            Layout.fillWidth: true
            model: ["Select your university","University of Mbandaka","University of Maniema","University of Kinshasa"]
            Layout.preferredHeight: 40
            Layout.leftMargin: 10; Layout.rightMargin: 10
        }
        SyComboBox{
            id: faculties
            Layout.fillWidth: true
            model: ["Select your faculty","Faculty of science","Faculty of Medicine","Faculty of Research and Development"]
            Layout.preferredHeight: 40
            Layout.leftMargin: 10; Layout.rightMargin: 10
        }
        SyComboBox{
            id: courses
            model: ["Select course","Computer science","Business Management","Software Engineering"]
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.topMargin: 10
            Layout.leftMargin: 10; Layout.rightMargin: 10
        }
        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            color: "transparent"
            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft
                SyButton{
                    Layout.rightMargin: 20
                    actionName: "Next"
                    background: Rectangle{
                        border.width: 0
                        color: Material.color(Material.Teal)
                        radius: 20
                    }
                    onClicked: {
                        Register.stackPushPage(SyConstants.pages.courseSelection,studiesSelectionPage,syStack,{})
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:10}
}
##^##*/
