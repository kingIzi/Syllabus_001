import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1
import Qt5Compat.GraphicalEffects
import Syllabus10 1.0
import "../syControls"
import "../../imports/syComponentsScripts.js" as SyComponents
import "../../imports/SyConstantScripts.js" as SyConstants


Drawer{
    id: syProfileDrawer
    height: root.height
    width: root.width
    edge: Qt.BottomEdge
    FileDialog {
        id: fileDialog
        currentFile: profilePic.source
        nameFilters: ["Image files (*.png *.jpg *.jpeg)"]
        onAccepted: {
            profilePic.source = file
        }
    }
    contentItem: Flickable{
        contentHeight: studentDetailsForm.implicitHeight + 10

        ColumnLayout{
            id: studentDetailsForm
            anchors.fill: parent
            anchors.margins: 8
            spacing: 4
            Rectangle{
                Layout.fillWidth: true
                Layout.preferredHeight: profileHeader.implicitHeight
                Layout.leftMargin: 8
                Layout.rightMargin: 8
                color: "transparent"
                RowLayout{
                    id: profileHeader
                    anchors.fill: parent
                    IconLabel{
                        text: SyConstants.fontello.left
                        font: Constants.largeFont2
                        Layout.alignment: Qt.AlignLeft
                        MouseArea{
                            anchors.fill: parent
                            onClicked: syProfileDrawer.close()
                        }
                    }
                    Label{
                        text: "My Profile"
                        Layout.alignment: Qt.AlignHCenter
                        font: Constants.largeFont2
                    }
                    SyButton{
                        actionName: "Done"
                        font: Constants.largeFont2
                        Layout.alignment: Qt.AlignRight
                        onClicked: syProfileDrawer.close()
                    }
                }
            }
            Pane{
                id: profileContainer
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                Layout.topMargin: 8
                background: Rectangle{
                    radius: 20
                    border.color: Material.color(Material.LightBlue)
                    color: "white"
                    layer.enabled: true
                    layer.effect: ElevationEffect{elevation: 1}
                }
                RowLayout{
                    anchors.fill: parent
                    IconImage{
                        id: profilePic
                        source: SyConstants.images.avatar
                        fillMode: "PreserveAspectFit"
                        sourceSize.width: 120
                        sourceSize.height: 60
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            maskSource: Rectangle {
                                id: mask
                                width: 120
                                height: 60
                                radius: 10
                                visible: false
                            }
                        }
                        Layout.rightMargin: 2
                    }
                    ColumnLayout{
                        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                        Text {
                            id: names
                            text: qsTr("Jane Doe")
                            font: Constants.largeFont2
                            color: "black"
                            Layout.fillWidth: true
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: classes
                            text: qsTr("05 October 1999 | 21 years old")
                            font: Constants.font
                            color: Material.color(Material.Grey,Material.Shade500)
                            Layout.fillWidth: true
                            wrapMode: Text.WordWrap
                        }
                    }
                    IconImage{
                        source: SyConstants.images.camera
                        Layout.alignment: Qt.AlignTop | Qt.AlignRight
                        fillMode: "PreserveAspectFit"
                        sourceSize.width: 30
                        sourceSize.height: 30
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                fileDialog.open()
                            }
                        }
                    }
                }
            }
            Label {
                text: qsTr("Student Details")
                font: Constants.largeFont
                padding: 10
            }
            GridLayout{
                id: profileGridStudentDetails
                columns: 2
                Repeater{
                    model: SyConstants.getProfileStudentGridModel()
                    delegate: ColumnLayout{
                        id: studentNumber
                        Layout.fillWidth: true
                        spacing: -2
                        Label{
                            text: modelData.label
                            Layout.fillWidth: true
                            color: Material.color(Material.Grey,Material.Shade700)
                        }
                        TextField{
                            Material.accent: Material.LightBlue
                            Material.foreground: "#000"
                            text: modelData.data
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
                }
            }
            Label {
                text: qsTr("Parent Contacts")
                font: Constants.largeFont
                padding: 10
            }
            Component{
                id: parentMail
                TextField{
                    Material.accent: Material.LightBlue
                    Material.foreground: "#000"
                    placeholderText: "Enter parent mail"
                    enabled: true
                    Layout.fillWidth: true
                    validator: RegularExpressionValidator { regularExpression: SyConstants.regex.emailAddress }
                    maximumLength: 50
                    focus: true
                    onFocusChanged: if (length === 0) destroy()
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
            Component{
                id: parentPhone
                TextField{
                    Material.accent: Material.LightBlue
                    Material.foreground: "#000"
                    placeholderText: "+243(0)"
                    enabled: true
                    Layout.fillWidth: true
                    validator: RegularExpressionValidator { regularExpression: SyConstants.regex.phoneNumber }
                    focus: true
                    onFocusChanged: if (length === 0) destroy()
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
                id: contactsMailColumn
                Layout.fillWidth: true
                spacing: -2
                RowLayout{
                    Label{
                        text: "Parent mail(s)"
                        Layout.fillWidth: true
                        color: Material.color(Material.Grey,Material.Shade700)
                        Layout.alignment: Qt.AlignLeft
                    }
                    IconImage{
                        source: SyConstants.images.plus
                        color: "black"
                        Layout.alignment: Qt.AlignRight
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                const sprite = parentMail.createObject(contactsMailColumn)
                                //syProfileDrawer.height = syProfileDrawer.height + sprite.height
                            }
                        }
                    }
                }
                TextField{
                    id: initialParentMail
                    Material.accent: Material.LightBlue
                    Material.foreground: "#000"
                    text: "Parent.JaneDoe@gmail.com"
                    enabled: true
                    Layout.fillWidth: true
                    maximumLength: 50
                    validator: RegularExpressionValidator { regularExpression: SyConstants.regex.emailAddress }
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
                id: contactsPhoneColumn
                Layout.fillWidth: true
                spacing: -2
                RowLayout{
                    Label{
                        text: "Parent phone number(s)"
                        Layout.fillWidth: true
                        color: Material.color(Material.Grey,Material.Shade700)
                        Layout.alignment: Qt.AlignLeft
                    }
                    IconImage{
                        source: SyConstants.images.plus
                        color: "black"
                        Layout.alignment: Qt.AlignRight
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                const sprite = parentPhone.createObject(contactsPhoneColumn)
                                //syProfileDrawer.height = syProfileDrawer.height + sprite.height
                            }
                        }
                    }
                }
                TextField{
                    id: initialParentPhone
                    Material.accent: Material.LightBlue
                    Material.foreground: "#000"
                    text: "8400000000"
                    enabled: true
                    Layout.fillWidth: true
                    validator: RegularExpressionValidator { regularExpression: SyConstants.regex.phoneNumber }
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
            Repeater{
                model: [{'label': 'Father name','data':'Aliko Ake Tshilombo'},{'label': 'Mother name','data':'Solange Deborah Tshilombo'}]
                delegate: ColumnLayout{
                    Layout.fillWidth: true
                    spacing: -2
                    Label{
                        text: modelData.label
                        Layout.fillWidth: true
                        color: Material.color(Material.Grey,Material.Shade700)
                        Layout.alignment: Qt.AlignLeft
                    }
                    TextField{
                        Material.accent: Material.LightBlue
                        Material.foreground: "#000"
                        text: modelData.data
                        enabled: true
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
            }
            Label {
                text: qsTr("Residential address")
                font: Constants.largeFont
                padding: 10
            }
            ColumnLayout{
                id: residentialAddress
                Layout.fillWidth: true
                Repeater{
                    model: [{'label': 'Commune','data':'Mont Ngafula, MAMA-YEMO'},{'label': 'Street','data':'Av Zongo No.6'}]
                    delegate: ColumnLayout{
                        Layout.fillWidth: true
                        spacing: -2
                        Label{
                            text: modelData.label
                            Layout.fillWidth: true
                            color: Material.color(Material.Grey,Material.Shade700)
                        }
                        TextField{
                            Material.accent: Material.LightBlue
                            Material.foreground: "#000"
                            text: modelData.data
                            enabled: true
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
                }
            }
        }

    }
}


//Drawer{
//    id: syProfileDrawer
//    height: root.height
//    width: root.width
//    edge: Qt.BottomEdge
//    FileDialog {
//        id: fileDialog
//        currentFile: profilePic.source
//        nameFilters: ["Image files (*.png *.jpg *.jpeg)"]
//        onAccepted: {
//            profilePic.source = file
//        }
//    }
//    ColumnLayout{
//        id: studentDetailsForm
//        anchors.fill: parent
//        anchors.margins: 8
//        spacing: 4
//        Rectangle{
//            Layout.fillWidth: true
//            Layout.preferredHeight: profileHeader.implicitHeight
//            Layout.leftMargin: 8
//            Layout.rightMargin: 8
//            color: "transparent"
//            RowLayout{
//                id: profileHeader
//                anchors.fill: parent
//                IconLabel{
//                    text: SyConstants.fontello.left
//                    font: Constants.largeFont2
//                    Layout.alignment: Qt.AlignLeft
//                    MouseArea{
//                        anchors.fill: parent
//                        onClicked: syProfileDrawer.close()
//                    }
//                }
//                Label{
//                    text: "My Profile"
//                    Layout.alignment: Qt.AlignHCenter
//                    font: Constants.largeFont2
//                }
//                SyButton{
//                    actionName: "Done"
//                    font: Constants.largeFont2
//                    Layout.alignment: Qt.AlignRight
//                    onClicked: syProfileDrawer.close()
//                }
//            }
//        }
//        Pane{
//            id: profileContainer
//            Layout.fillWidth: true
//            Layout.preferredHeight: 80
//            Layout.leftMargin: 10
//            Layout.rightMargin: 10
//            Layout.topMargin: 8
//            background: Rectangle{
//                radius: 20
//                border.color: Material.color(Material.LightBlue)
//                color: "white"
//                layer.enabled: true
//                layer.effect: ElevationEffect{elevation: 1}
//            }
//            RowLayout{
//                anchors.fill: parent
//                IconImage{
//                    id: profilePic
//                    source: "qrc:/forms/images/avatar.png"
//                    fillMode: "PreserveAspectFit"
//                    sourceSize.width: 120
//                    sourceSize.height: 60
//                    layer.enabled: true
//                    layer.effect: OpacityMask {
//                        maskSource: Rectangle {
//                            id: mask
//                            width: 120
//                            height: 60
//                            radius: 10
//                            visible: false
//                        }
//                    }
//                    Layout.rightMargin: 2
//                }
//                ColumnLayout{
//                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
//                    Text {
//                        id: names
//                        text: qsTr("Jane Doe")
//                        font: Constants.largeFont2
//                        color: "black"
//                        Layout.fillWidth: true
//                        wrapMode: Text.WordWrap
//                    }
//                    Text {
//                        id: classes
//                        text: qsTr("05 October 1999 | 21 years old")
//                        font: Constants.font
//                        color: Material.color(Material.Grey,Material.Shade500)
//                        Layout.fillWidth: true
//                        wrapMode: Text.WordWrap
//                    }
//                }
//                IconImage{
//                    source: "qrc:/forms/images/camera.png"
//                    Layout.alignment: Qt.AlignTop | Qt.AlignRight
//                    fillMode: "PreserveAspectFit"
//                    sourceSize.width: 30
//                    sourceSize.height: 30
//                    MouseArea{
//                        anchors.fill: parent
//                        onClicked: {
//                            fileDialog.open()
//                        }
//                    }
//                }
//            }
//        }
//        Label {
//            text: qsTr("Student Details")
//            font: Constants.largeFont
//            padding: 10
//        }
//        GridLayout{
//            id: profileGridStudentDetails
//            columns: 2
//            Repeater{
//                model: SyConstants.getProfileStudentGridModel()
//                delegate: ColumnLayout{
//                    id: studentNumber
//                    Layout.fillWidth: true
//                    spacing: -2
//                    Label{
//                        text: modelData.label
//                        Layout.fillWidth: true
//                        color: Material.color(Material.Grey,Material.Shade700)
//                    }
//                    TextField{
//                        Material.accent: Material.LightBlue
//                        Material.foreground: "#000"
//                        text: modelData.data
//                        enabled: false
//                        Layout.fillWidth: true
//                        IconLabel{
//                            text: SyConstants.fontello.lock
//                            color: Material.color(Material.Grey,Material.Shade500)
//                            anchors{
//                                top: parent.top
//                                right: parent.right
//                                verticalCenter: parent.verticalCenter
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        Label {
//            text: qsTr("Parent Contacts")
//            font: Constants.largeFont
//            padding: 10
//        }
//        Component{
//            id: parentMail
//            TextField{
//                Material.accent: Material.LightBlue
//                Material.foreground: "#000"
//                placeholderText: "Enter parent mail"
//                enabled: true
//                Layout.fillWidth: true
//                validator: RegularExpressionValidator { regularExpression: SyConstants.regex.emailAddress }
//                maximumLength: 50
//                focus: true
//                onFocusChanged: if (length === 0) destroy()
//                IconLabel{
//                    text: SyConstants.fontello.lock
//                    color: Material.color(Material.Grey,Material.Shade500)
//                    anchors{
//                        top: parent.top
//                        right: parent.right
//                        verticalCenter: parent.verticalCenter
//                    }
//                }
//            }
//        }
//        Component{
//            id: parentPhone
//            TextField{
//                Material.accent: Material.LightBlue
//                Material.foreground: "#000"
//                placeholderText: "+243(0)"
//                enabled: true
//                Layout.fillWidth: true
//                validator: RegularExpressionValidator { regularExpression: SyConstants.regex.phoneNumber }
//                focus: true
//                onFocusChanged: if (length === 0) destroy()
//                IconLabel{
//                    text: SyConstants.fontello.lock
//                    color: Material.color(Material.Grey,Material.Shade500)
//                    anchors{
//                        top: parent.top
//                        right: parent.right
//                        verticalCenter: parent.verticalCenter
//                    }
//                }
//            }
//        }
//        ColumnLayout{
//            id: contactsMailColumn
//            Layout.fillWidth: true
//            spacing: -2
//            RowLayout{
//                Label{
//                    text: "Parent mail(s)"
//                    Layout.fillWidth: true
//                    color: Material.color(Material.Grey,Material.Shade700)
//                    Layout.alignment: Qt.AlignLeft
//                }
//                IconImage{
//                    source: "qrc:/forms/images/icons/plus.svg"
//                    color: "black"
//                    Layout.alignment: Qt.AlignRight
//                    MouseArea{
//                        anchors.fill: parent
//                        onClicked: {
//                            const sprite = parentMail.createObject(contactsMailColumn)
//                            //syProfileDrawer.height = syProfileDrawer.height + sprite.height
//                        }
//                    }
//                }
//            }
//            TextField{
//                id: initialParentMail
//                Material.accent: Material.LightBlue
//                Material.foreground: "#000"
//                text: "Parent.JaneDoe@gmail.com"
//                enabled: true
//                Layout.fillWidth: true
//                maximumLength: 50
//                validator: RegularExpressionValidator { regularExpression: SyConstants.regex.emailAddress }
//                IconLabel{
//                    text: SyConstants.fontello.lock
//                    color: Material.color(Material.Grey,Material.Shade500)
//                    anchors{
//                        top: parent.top
//                        right: parent.right
//                        verticalCenter: parent.verticalCenter
//                    }
//                }
//            }
//        }
//        ColumnLayout{
//            id: contactsPhoneColumn
//            Layout.fillWidth: true
//            spacing: -2
//            RowLayout{
//                Label{
//                    text: "Parent phone number(s)"
//                    Layout.fillWidth: true
//                    color: Material.color(Material.Grey,Material.Shade700)
//                    Layout.alignment: Qt.AlignLeft
//                }
//                IconImage{
//                    source: "qrc:/forms/images/icons/plus.svg"
//                    color: "black"
//                    Layout.alignment: Qt.AlignRight
//                    MouseArea{
//                        anchors.fill: parent
//                        onClicked: {
//                            const sprite = parentPhone.createObject(contactsPhoneColumn)
//                            //syProfileDrawer.height = syProfileDrawer.height + sprite.height
//                        }
//                    }
//                }
//            }
//            TextField{
//                id: initialParentPhone
//                Material.accent: Material.LightBlue
//                Material.foreground: "#000"
//                text: "8400000000"
//                enabled: true
//                Layout.fillWidth: true
//                validator: RegularExpressionValidator { regularExpression: SyConstants.regex.phoneNumber }
//                IconLabel{
//                    text: SyConstants.fontello.lock
//                    color: Material.color(Material.Grey,Material.Shade500)
//                    anchors{
//                        top: parent.top
//                        right: parent.right
//                        verticalCenter: parent.verticalCenter
//                    }
//                }
//            }
//        }
//        Repeater{
//            model: [{'label': 'Father name','data':'Aliko Ake Tshilombo'},{'label': 'Mother name','data':'Solange Deborah Tshilombo'}]
//            delegate: ColumnLayout{
//                Layout.fillWidth: true
//                spacing: -2
//                Label{
//                    text: modelData.label
//                    Layout.fillWidth: true
//                    color: Material.color(Material.Grey,Material.Shade700)
//                    Layout.alignment: Qt.AlignLeft
//                }
//                TextField{
//                    Material.accent: Material.LightBlue
//                    Material.foreground: "#000"
//                    text: modelData.data
//                    enabled: true
//                    Layout.fillWidth: true
//                    IconLabel{
//                        text: SyConstants.fontello.lock
//                        color: Material.color(Material.Grey,Material.Shade500)
//                        anchors{
//                            top: parent.top
//                            right: parent.right
//                            verticalCenter: parent.verticalCenter
//                        }
//                    }
//                }
//            }
//        }
//        Label {
//            text: qsTr("Residential address")
//            font: Constants.largeFont
//            padding: 10
//        }
//        GridLayout{
//            id: residentialAddress
//            Layout.fillWidth: true
//            columns: 2
//            Repeater{
//                model: [{'label': 'Commune','data':'Mont Ngafula, MAMA-YEMO'},{'label': 'Street','data':'Av Zongo No.6'}]
//                delegate: ColumnLayout{
//                    Layout.fillWidth: true
//                    spacing: -2
//                    Label{
//                        text: modelData.label
//                        Layout.fillWidth: true
//                        color: Material.color(Material.Grey,Material.Shade700)
//                    }
//                    TextField{
//                        Material.accent: Material.LightBlue
//                        Material.foreground: "#000"
//                        text: modelData.data
//                        enabled: false
//                        Layout.fillWidth: true
//                        IconLabel{
//                            text: SyConstants.fontello.lock
//                            color: Material.color(Material.Grey,Material.Shade500)
//                            anchors{
//                                top: parent.top
//                                right: parent.right
//                                verticalCenter: parent.verticalCenter
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

