import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QT5csyllabus 1.0

Rectangle{
    id: bannerContainer
    FontLoader{
        id: logoFont
        source: "../../fonts/Roboto-Bold.ttf"
    }
    color: Constants.backgroundColor
    RowLayout{
        id: banner
        width: 141
        height: 32
        x: 203
        y: 45
        spacing: 4
        anchors{
            topMargin: 8
            right: bannerContainer.right
            top: bannerContainer.top
        }
        Frame{
            background: Rectangle{
                color: "transparent"
                Rectangle{
                    id: rect1
                    width: 12.73;
                    height: 12.73
                    rotation: 45
                    z: 1
                    y: 6
                    x: 6
                    color: "#08456A"
                }
                Rectangle{
                    id: rect2
                    width: 17;
                    height: 17
                    y: 4
                    x: 4
                    rotation: 45
                    color: "#3A92C7"
                }
            }
        }
        Text {
            id: logoLetter
            text: qsTr("Tanga")
            font.family: logoFont.name
            font.pixelSize: 20
            font.letterSpacing: 4
            color: "#b64848"
        }
    }
}

