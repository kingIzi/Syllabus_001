import QtQuick 2.0
import QtQuick.Controls 2.15
import Syllabus10 1.0
import "./syControls"
import "./syComponents"
import "../imports/SyConstantScripts.js" as SyConstants

StackView{
    id: syStackViewLoginItem
    initialItem: Page{
        id: loginPage
        width: root.width
        height: root.height
        background: Rectangle{
            color: "#F3F5F9"
        }
        Component{
            id: registerForm
            SyRegisterPage{}
        }
        SyHeaderLogo{
            id: banner
            width: loginPage.width
            height: 50
        }
        SyLoginForm{
            id: loginForm
            anchors{
                top: banner.bottom
                left: parent.left
                right: parent.right
                leftMargin: 20
                rightMargin: 20
                topMargin: 40
            }
            Connections{
                target: loginForm
                function onSuccessfullLogin(){
                    appLoader.sourceComponent = homePage
                }
                function onClickHereClicked(){
                    syStackViewLoginItem.push(registerForm)
                }
            }
        }
    }
}
