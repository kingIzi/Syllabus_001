import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects
import SyLib 1.0
import "../components"
import "qrc:/scripts.js" as Scripts

Page{
    id: accountsPage
    Component.onCompleted: {
        navigationBar.rightItems = undefined
    }
    onVisibleChanged: {
        navigationBar.rightItems = Scripts.getSideNavIcons()
    }
    Component{
        id: editAccountPage
        EditAccountPage{}
    }
    Component{
        id: changePasswordPage
        ChangePasswordPage{}
    }
    Component{
        id: coursesSelectionPage
        CoursesSelectionPage{}
    }

    Flickable{
        anchors.fill: parent
        contentWidth: availableWidth
        contentHeight: accountsColumn.height
        ColumnLayout{
            id: accountsColumn
            height: implicitHeight
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
            }
            Item{
                id: profileItem
                Layout.fillWidth: true
                implicitWidth: parent.width
                implicitHeight: (profilePicture.height + usernameLabel.implicitHeight)
                Layout.margins: 10
                Layout.alignment: Qt.AlignTop
                RoundImage{
                    id: profilePicture
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label{
                    id: usernameLabel
                    text: "Scott.izidore@gmail.com"
                    font: Constants.constantsFonts.primaryFont
                    horizontalAlignment: "AlignHCenter"
                    anchors{
                        top: profilePicture.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            Repeater{
                id: userSettingsRepeater
                signal pushAccountsPage()
                signal pushSecurityPage()
                signal pushCoursesPage()
                signal pushSubscriptionPage()
                readonly property var appSettings: {"label": "Application Settings","data": [{"icon":Constants.icons.menuBook,"label": "My courses"},{"icon":Constants.icons.paid,"label": "My Subscription"}]}
                model: {
                    return [{"label": "User Settings","data": [{"icon":Constants.icons.person,"label": "My Account"},{"icon":Constants.icons.lock,"label": "Change password"}]},appSettings]
                }
                delegate: ColumnLayout{
                    id: userSettingColumn
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    spacing: 20
                    Label{
                        text: modelData.label
                        font: Constants.constantsFonts.secondaryFont
                        color: Material.color(Material.Grey,Material.Shade700)
                        Layout.fillWidth: true
                        wrapMode: "WordWrap"
                        padding: 20
                    }
                    Repeater{
                        id: userSettingsActionRepeater
                        model: modelData.data
                        delegate: ItemDelegate{
                            id: accountSettingsAction
                            Layout.fillWidth: true
                            implicitHeight: accountLabel.implicitHeight * 2
                            IconLabel{
                                id: accountLabel
                                anchors.fill: parent
                                icon.source: modelData.icon
                                icon.color: Material.color(Material.Blue,Material.Shade900)
                                text: modelData.label
                                font: Constants.constantsFonts.primaryFont
                                spacing: 8
                                DivisorLine{
                                    anchors.bottom: parent.bottom
                                }
                                IconImage{
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    source: Constants.icons.navigateNext
                                }
                            }
                            onClicked: {
                                Scripts.openAccountPage(userSettingsRepeater,userSettingColumn,userSettingsActionRepeater,accountSettingsAction)
                            }
                        }
                    }
                }
            }
            Connections{
                target: userSettingsRepeater
                function onPushAccountsPage(){
                    navigationBar.currentStack.push(editAccountPage)
                }
                function onPushSecurityPage(){
                    navigationBar.currentStack.push(changePasswordPage)
                }
                function onPushCoursesPage(){
                    navigationBar.currentStack.push(coursesSelectionPage)
                }
                function onPushSubscriptionPage(){
                    console.log("Subscription")
                }
            }
        }
    }
}

