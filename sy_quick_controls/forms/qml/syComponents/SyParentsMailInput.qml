import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../imports/SyConstantScripts.js" as SyConstants

GridLayout{
    id: profileGrid
    columns: 2
    ColumnLayout{
        id: studentNumber
        Layout.fillWidth: true
        spacing: -2
        Label{
            text: "Student number"
            Layout.fillWidth: true
            color: Material.color(Material.Grey,Material.Shade700)
        }
        TextField{
            Material.accent: Material.LightBlue
            Material.foreground: "#000"
            text: "T0112609"
            enabled: false
            Layout.fillWidth: true
            IconLabel{
                text: SyConstants.fontello.lock
                color: Material.color(Material.Grey,Material.Shade500)
                anchors{
                    top: parent.top
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    ColumnLayout{
        id: academicYear
        Layout.fillWidth: true
        spacing: -2
        Label{
            text: "Academic year"
            color: Material.color(Material.Grey,Material.Shade700)
            Layout.fillWidth: true
        }
        TextField{
            Material.accent: Material.LightBlue
            Material.foreground: "#000"
            text: "2021-2022"
            Layout.fillWidth: true
            enabled: false
            IconLabel{
                text: SyConstants.fontello.lock
                color: Material.color(Material.Grey,Material.Shade500)
                anchors{
                    top: parent.top
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    ColumnLayout{
        id: currentCourse
        Layout.fillWidth: true
        spacing: -2
        Label{
            text: "Course"
            color: Material.color(Material.Grey,Material.Shade700)
            Layout.fillWidth: true
        }
        TextField{
            Material.accent: Material.LightBlue
            Material.foreground: "#000"
            text: "Civil Engineering"
            Layout.fillWidth: true
            enabled: false
            IconLabel{
                text: SyConstants.fontello.lock
                color: Material.color(Material.Grey,Material.Shade500)
                anchors{
                    top: parent.top
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    ColumnLayout{
        id: yearsStudy
        Layout.fillWidth: true
        spacing: -2
        Label{
            text: "Years Study"
            Layout.fillWidth: true
            color: Material.color(Material.Grey,Material.Shade700)
        }
        TextField{
            Material.accent: Material.LightBlue
            Material.foreground: "#000"
            text: "1st Graduate"
            enabled: false
            Layout.fillWidth: true
            IconLabel{
                text: SyConstants.fontello.lock
                color: Material.color(Material.Grey,Material.Shade500)
                anchors{
                    top: parent.top
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    ColumnLayout{
        id: dateOfAdmission
        Layout.fillWidth: true
        spacing: -2
        Label{
            text: "Date of Admission"
            Layout.fillWidth: true
            color: Material.color(Material.Grey,Material.Shade700)
        }
        TextField{
            Material.accent: Material.LightBlue
            Material.foreground: "#000"
            text: "21 Sept 2020"
            Layout.fillWidth: true
            enabled: false
            IconLabel{
                text: SyConstants.fontello.lock
                color: Material.color(Material.Grey,Material.Shade500)
                anchors{
                    top: parent.top
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    ColumnLayout{
        id: predictedGraduation
        Layout.fillWidth: true
        spacing: -2
        Label{
            Layout.fillWidth: true
            text: "Predicted Graduation date"
            color: Material.color(Material.Grey,Material.Shade700)
        }
        TextField{
            Material.accent: Material.LightBlue
            Material.foreground: "#000"
            text: "08 July 2023"
            Layout.fillWidth: true
            enabled: false
            IconLabel{
                text: SyConstants.fontello.lock
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
