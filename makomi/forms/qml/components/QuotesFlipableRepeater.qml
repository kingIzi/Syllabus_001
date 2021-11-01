import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import SyLib 1.0
import "../models"

Repeater{
    model: QuotesModel{
        id: quotesModel
    }
    delegate: Flipable{
        id: quotesFlipable
        property bool flipped: false
        front: Label{
            id: quoteLabel
            font: Constants.constantsFonts.secondaryFont
            width: parent.width
            wrapMode: "WordWrap"
            text: quote
            horizontalAlignment: "AlignHCenter"
            anchors{
                verticalCenter: parent.verticalCenter
            }
        }
        back: ColumnLayout{
            width: parent.width
            spacing: 10
            Label{
                id: tribeLabel
                font: Constants.constantsFonts.secondaryFont
                Layout.fillWidth: true
                wrapMode: "WordWrap"
                text: tribe
                horizontalAlignment: "AlignHCenter"
            }
            Label{
                id: descriptionLabel
                font: Constants.constantsFonts.secondaryFont
                Layout.fillWidth: true
                wrapMode: "WordWrap"
                text: briefHistory
                horizontalAlignment: "AlignHCenter"
                color: Material.color(Material.Grey,Material.Shade500)
            }
            Image{
                id: elderImage
                sourceSize.width: 80
                sourceSize.height: 80
                source: elder
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignHCenter
            }
        }

        transform: Rotation {
            id: rotation
            origin.x: quotesFlipable.width/2
            origin.y: quotesFlipable.height/2
            axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
            angle: 0    // the default angle
        }

        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: quotesFlipable.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 1000 }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: quotesFlipable.flipped = !quotesFlipable.flipped
        }
    }
}
