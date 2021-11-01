import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../components"

Page{
    id: editPage
    contentItem: Flickable{
        contentHeight: editAccountColumn.implicitHeight
        ColumnLayout{
            id: editAccountColumn
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
            }
            Label {
                text: qsTr("Your details")
                padding: 10
                font: Constants.constantsFonts.secondaryFont
            }
            GridLayout{
                id: profileGridStudentDetails
                columns: root.width < 500 ? 2 : 3
                Layout.margins: 10
                Repeater{
                    model: [{'label': 'Student number','data': 'T0112609'},{'label': 'Academic year','data': '2021-2022'},{'label': 'Course','data': 'Civil Engineering'},{'label': 'Years study','data': '1st Graduate'},{'label': 'Admission date','data': '21 Sept 2020'},{'label': 'Graduation date (predicted)','data': '07 July 2023'}]
                    delegate: ColumnLayout{
                        id: studentNumber
                        Layout.fillWidth: true
                        Label{
                            text: modelData.label
                            Layout.fillWidth: true
                            color: Material.color(Material.Grey,Material.Shade700)
                            font: Constants.constantsFonts.primaryFont
                            wrapMode: "WordWrap"
                        }
                        TextField{
                            Material.accent: Material.Blue
                            Material.foreground: "#000"
                            text: modelData.data
                            enabled: false
                            Layout.fillWidth: true
                            font: Constants.constantsFonts.primaryFont
                        }
                    }
                }
            }
            Label {
                text: qsTr("Residential Address")
                padding: 10
                font: Constants.constantsFonts.secondaryFont
            }
            Repeater{
                model: [{'label': 'Commune','data':'Mont Ngafula, MAMA-YEMO'},{'label': 'Street','data':'Av Zongo No.6'}]
                delegate: ColumnLayout{
                    Layout.fillWidth: true
                    Layout.margins: 10
                    Label{
                        text: modelData.label
                        Layout.fillWidth: true
                        color: Material.color(Material.Grey,Material.Shade700)
                        wrapMode: "WordWrap"
                    }
                    TextField{
                        Material.accent: Material.LightBlue
                        Material.foreground: "#000"
                        text: modelData.data
                        enabled: true
                        Layout.fillWidth: true
                        font: Constants.constantsFonts.primaryFont
                        IconLabel{
                            icon.source: Constants.icons.lock
                            color: Material.color(Material.Grey,Material.Shade500)
                            anchors{
                                top: parent.top
                                right: parent.right
                                verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }
            ActionButton{
                Layout.alignment: Qt.AlignRight
                text: "Save"
                Layout.rightMargin: 10
            }
        }
    }
}

