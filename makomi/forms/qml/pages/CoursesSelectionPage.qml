import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0
import "../components"

Page{
    id: coursesSelectionPage
    contentItem: Flickable{
        contentHeight: subjectsColumn.implicitHeight + saveBtn.implicitHeight
        ColumnLayout{
               id: subjectsColumn
               anchors{
                   top: parent.top
                   left: parent.left
                   right: parent.right
               }
               Label{
                   Layout.fillWidth: true
                   Layout.margins: 10
                   text: "Select your subject interests"
                   color: "black"
                   Layout.alignment: Qt.AlignHCenter
                   font: Constants.constantsFonts.secondaryFont
                   wrapMode: "WordWrap"
               }
               GridLayout{
                   Layout.fillWidth: true
                   readonly property int elementWidth: 130
                   columns: Math.max(Math.floor(parent.width / elementWidth), 1)
                   rows: Math.max(Math.ceil(children.length / columns), 1)
                   clip: true
                   Repeater{
                       model: Array.from({length: 30}, (_, index) => index + 1);
                       delegate: CheckBox{
                           Layout.fillWidth: true
                           text: "Subject ID"
                           Material.accent: Material.color(Material.LightBlue)
                           Layout.leftMargin: 4
                           Material.foreground: "black"
                           font: Constants.constantsFonts.primaryFont
                       }
                   }
               }
               ActionButton{
                   id: saveBtn
                   Layout.alignment: Qt.AlignRight
                   text: "Save"
                   Layout.rightMargin: 10
               }
           }
    }
}
