import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "pages"
import "models"
import "components"
import "qrc:/scripts.js" as Scripts


ApplicationWindow {
    id: root
    width: Constants.dimensions.appWidth
    height: Constants.dimensions.appHeight
    visible: true
    title: qsTr("Syllabus")
    background: Rectangle{
        color: Constants.constantsColors.backgroundColor
    }
    minimumWidth: Constants.dimensions.appMinWidth
    minimumHeight: Constants.dimensions.appMinHeight
    header: NavBar{
        id: navigationBar
        title: "Home"
    }
    Component{
        id: home
        StackView{
            initialItem: HomePage{}
        }
    }
    Component{
        id: login
        StackView{
            initialItem: LoginPage{}
        }
    }
    Component{
        id: saved
        StackView{
            initialItem: FavoritesPage{}
        }
    }
    Component{
        id: didYouKnow
        StackView{
            initialItem: QuotesPage{}
        }
    }
    Component{
        id: myAccount
        StackView{
            initialItem: AccountPage{}
        }
    }
    Navigation{
        id: appLoader
        Connections{
            target: appLoader
            function onNavigationChanged(index){
                Scripts.signals.onNavigationChanged(index,navigationBar)
            }
        }
    }
}


