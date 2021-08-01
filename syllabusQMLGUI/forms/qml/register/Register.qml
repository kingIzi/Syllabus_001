import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import "../"
import "qrc:/forms/imports/registration.js" as LoginScript

StackView{
    id: register
//    initialItem: Page{
//        id: loginPage
//        GuiConstants { id: constants }
//        implicitWidth: constants.width
//        implicitHeight: constants.height
//        SyInnerBackground{id: formBackground}
//        SyText{
//            id: welcomeMsg
//            text: LoginScript.registerLoginHeaderTextToogle(registerLoader.source)
//            font.bold: true
//            font.letterSpacing: 4
//            font.pixelSize: 40
//            wrapMode: Text.WordWrap
//            width: parent.width
//            horizontalAlignment: Text.AlignHCenter
//            padding: 32
//        }
//        Loader{
//            id: registerLoader
//            source: LoginScript.pages.loginForm
//            active: visible
//            visible: true
//            anchors{
//                top: welcomeMsg.bottom
//                left: formBackground.left
//                right: formBackground.right
//                bottom: formBackground.bottom
//            }
//        }
//    }
    initialItem: StudiesSelection{}
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
