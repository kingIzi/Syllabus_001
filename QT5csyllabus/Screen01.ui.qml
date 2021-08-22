import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QT5csyllabus 1.0
import "components/syControls"
import "./imports/SyComponentsScripts.js" as SyComponents


Page{
    id: loginPage
    width: Constants.width
    height: Constants.height
    implicitHeight: loginPage.height
    implicitWidth: loginPage.width
    background: Rectangle{
        color: "#F3F5F9"
    }
    SyTopNav{
        id: banner
        width: loginPage.width
        height: 50
    }
    LoginForm{
        id: loginForm
        anchors{
            top: banner.bottom
            left: parent.left
            right: parent.right
            leftMargin: 20
            rightMargin: 20
            topMargin: 40
        }
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.1}
}
##^##*/

