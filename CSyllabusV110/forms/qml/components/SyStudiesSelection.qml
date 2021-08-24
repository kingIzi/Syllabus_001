import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import CSyllabusV110 1.0
import "../components/syControls"
import "qrc:/forms/imports/syComponentsScripts.js" as SyComponents
import "qrc:/forms/imports/syConstantScripts.js" as SyConstants

Page{
    id: studiesSelectionPage
    width: parent.width
    height: parent.height
    background: SyInnerBackground{}
    Component{
        id: allSubjects
        SyCoursesSelection{}
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
            font: Constants.headerFont
            text: "Complete the form below to continue."
            lineHeight: 1
            color: "black"
        }
        SyText{
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.bottomMargin: 10
            text: "You are in,"
            font: Constants.largeFont
            color: "black"
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
                        color: (btn.isActive) ? Material.color(Material.Grey,Material.Shade100) : "grey"
                        text: btn.text
                        font: Constants.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    width: parent.width / 4
                    Layout.fillWidth: true
                    Material.background: (btn.isActive) ? Material.color(Material.LightBlue,Material.Shade700) : "transparent"
                    onClicked: {
                        SyComponents.selectedGrades(btn,allGrades.children)
                    }
                }
            }
        }
        SyText{
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.bottomMargin: 10
            text: "University & Faculty"
            font: Constants.largeFont
            color: "black"
        }
        SyComboBox{
            id: universities
            Layout.fillWidth: true
            model: ["Select your university","University of Mbandaka","University of Maniema","University of Kinshasa"]
            Layout.preferredHeight: 40
            Layout.leftMargin: 10; Layout.rightMargin: 10
            font: Constants.font
        }
        SyComboBox{
            id: faculties
            Layout.fillWidth: true
            model: ["Select your faculty","Faculty of science","Faculty of Medicine","Faculty of Research and Development"]
            Layout.preferredHeight: 40
            Layout.leftMargin: 10; Layout.rightMargin: 10
            font: Constants.font
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
                    onClicked: {
                        const page = Qt.createComponent("qrc:/forms/qml/components/SyCoursesSelection.qml",studiesSelectionPage)
                        const pageObject = page.createObject(studiesSelectionPage,{})
                        loginStackView.push(pageObject)
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
