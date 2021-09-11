import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import Syllabus10 1.0
import "./syControls"
import "./syComponents"
import "../imports/SyConstantScripts.js" as SyConstants


StackView{
    id: syHomeStack
    initialItem: Page{
        contentItem: ListView{
            id: homePageItems
            model: 1
            headerPositioning: ListView.PullBackHeader
            delegate: SyHomeForm{}
            spacing: 10
            header: SyHeader{}
        }
    }
}

