import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import SyLib 1.0
import "components"
import "models"
import "controls"
import "pages"
import "qrc:/scripts.js" as Scripts

ToolBar{
    id: navBar
    width: parent.width
    height: 56
    Material.background: Material.color(Material.Blue,Material.Shade900)
    Material.elevation: 3
    visible: !(appLoader.sourceComponent === login)
    property var rightItems: undefined
    property string title: titleText
    property bool isSearching: false
    property string searchString: ""
    property StackView currentStack: appLoader.item
    signal searchClicked()
    signal filterClicked()
    property alias sideNavigation: sideNav.sideNavListModel
    Component{
        id: searchView
        ListView{
            id: searchListView
            footer: Label{
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
                text: "Search not found."
                font: Constants.constantsFonts.primaryFont
                width: searchListView.width
                height: 56
                DivisorLine{
                    anchors.bottom: parent.bottom
                }
                visible: (searchListView.recentSearchModel.length === 0)
            }
            readonly property var recentSearchModel: ["Recent search 1","Recent search 2","Recent search 3","Recent search 4","Recent search 5","Recent search 6"]
            model: recentSearchModel
            delegate: ItemDelegate{
                id: searchTextDelegate
                text: modelData
                width: searchListView.width
                font: Constants.constantsFonts.primaryFont
                onClicked: {
                    findItems(searchItemsFound)
                    searchString = searchTextDelegate.text
                }
            }
        }
    }
    Component{
        id: searchItemsFound
        SearchResultsPage{
            syllabusModel: 4
        }
    }

    Connections{
        target: navBar
        function onSearchClicked(){
            isSearching = true
        }
        function onFilterClicked(){
            filterDrawer.open()
        }
    }
    Connections{
        target: navBar
        function onSearchClicked(){
            isSearching = true
            currentStack.push(searchView)
        }
        function onFilterClicked(){
            filterDrawer.open()
        }
    }
    SideNavDrawer{
        id: sideNav
    }
    SyllabusFilter{
        id: filterDrawer
    }
    Loader{
        id: navBarLoader
        visible: !isSearching
        active: visible
        anchors.fill: parent
        sourceComponent: RowLayout{
            ToolButton{
                id: menu
                readonly property bool navigateBack: navBar.currentStack.children.length > 1
                icon.source: (navigateBack) ? Constants.icons.arrowBack : Constants.icons.menu
                icon.height: 30
                icon.width: 30
                Material.background: "transparent"
                Material.foreground: "#fff"
                Layout.alignment: Qt.AlignLeft
                onClicked: {
                    if (navigateBack){
                        navBar.currentStack.pop()
                    }
                    else{
                        sideNav.open()
                    }
                }
            }
            Label {
                id: titleText
                text: title
                elide: Label.ElideRight
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font: Constants.constantsFonts.secondaryFont
            }
            Repeater{
                id: rightItems
                Layout.alignment: Qt.AlignRight
                model: navBar.rightItems
                delegate: ToolButton{
                    id: iconBtn
                    icon.source: modelData
                    Material.foreground: "#fff"
                    icon.height: 30
                    icon.width: 30
                    Material.background: "transparent"
                    onClicked: {
                       Scripts.switchNavBarAction(iconBtn.icon.source.toString(),Constants.icons,navBar)
                    }
                }
            }
        }
    }
    Loader{
        id: searchBarLoader
        visible: isSearching
        active: visible
        anchors.fill: parent
        sourceComponent: RowLayout{
            ToolButton{
                id: backArrow
                icon.source: Constants.icons.arrowBack
                icon.height: 30
                icon.width: 30
                Material.background: "transparent"
                Material.foreground: "#fff"
                Layout.alignment: Qt.AlignLeft
                onClicked: {
                    isSearching = false
                    navBar.currentStack.pop()
                }
            }
            TextField{
                id: searchSyllabusTextField
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.rightMargin: 10
                text: searchString
                Material.foreground: "#fff"
                Material.accent: "black"
                font: Constants.constantsFonts.primaryFont
                placeholderText: "Search Syllabus"
                placeholderTextColor: Material.color(Material.Grey,Material.Shade200)
                onAccepted: {
                    if (searchSyllabusTextField.text.length !== 0){
                        findItems(searchItemsFound)
                    }
                }
            }
        }
    }
    function findItems(searchItemsFound){
        currentStack.pop()
        currentStack.push(searchItemsFound)
    }
}




