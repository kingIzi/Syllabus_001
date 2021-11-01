import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "models"
import "qrc:/scripts.js" as Scripts

Drawer{
    id: sideNavBar
    width: 0.60 * root.width
    height: root.height
    property alias sideNavListModel: sideNavListView
    enum Navigations{
        Home = 0,
        Favorites = 1,
        DidYouKnow = 2,
        Account = 3,
        Login = 4
    }
    Rectangle{
        id: logoContainer
        color: "transparent"
        width: sideNav.width
        height: 120
        Image{
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/dummyLogo.png"
        }
    }
    ListView{
        id: sideNavListView
        width: sideNav.width
        height: (sideNav.height - logoContainer.height)
        readonly property int delegateHeight: 50
        anchors{
            top: logoContainer.bottom
            left: parent.left
            right: parent.right
            topMargin: 30
        }
        model: SideNavListModel{
            id: sideNavModel
        }
        delegate: ItemDelegate{
            width: sideNavListView.width
            height: sideNavListView.delegateHeight
            IconLabel{
                id: itemDel
                anchors.fill: parent
                icon.source: iconImage
                spacing: 8
                text: label
                color: (sideNavListView.currentIndex === index) ? Material.color(Material.Blue) : "#000000000"
                font: Constants.constantsFonts.secondaryFont
                Rectangle{
                    width: parent.width
                    height: 1
                    color: Material.color(Material.Grey,Material.Shade300)
                    anchors.bottom: parent.bottom
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        sideNavListView.currentIndex = index
                        Scripts.onSideNavItemClicked(appLoader,index,SideNavDrawer.Navigations)
                        sideNav.close()
                    }
                }
            }
        }
    }
}

