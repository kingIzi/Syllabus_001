import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import SyLib 1.0

Pane{
    id: quotesCard
    Component.onCompleted: {
        navigationBar.rightItems = undefined
    }
    Material.background: "#fff"
    Material.elevation: 4
    IconImage{
        id: quotesIcon
        source: Constants.icons.formatQuote
        anchors{
            top: parent.top
            left: parent.left
        }
    }
    SwipeView{
        id: quotesSwipe
        width: parent.width
        height: (quotesCard.height - (quoteRow.implicitHeight + quotesIcon.implicitHeight))
        anchors{
            top: quotesIcon.bottom
            bottom: quoteRow.top
        }
        clip: true
        QuotesFlipableRepeater{
            id: quotesSwipeRepeater
        }
    }
    RowLayout{
        id: quoteRow
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        RoundButton{
            id: leftArrow
            Layout.alignment: Qt.AlignLeft
            icon.source: Constants.icons.arrowLeft
            Material.background: "black"
            Material.foreground: "#fff"
            enabled: (quotesSwipe.currentIndex !== 0)
            onClicked: quotesSwipe.currentIndex--
        }
        PageIndicator{
            id: swipeIndicator
            currentIndex: quotesSwipe.currentIndex
            count: quotesSwipe.count
            Layout.alignment: Qt.AlignHCenter
            delegate: Rectangle{
                id: activeRect
                readonly property var lightGrey: Material.color(Material.Grey,Material.Shade300)
                readonly property var darkGrey: Material.color(Material.Grey,Material.Shade900)
                width: 6
                height: 6
                radius: 3
                color: (swipeIndicator.currentIndex === index) ? activeRect.darkGrey: activeRect.lightGrey
            }
        }
        RoundButton{
            id: rightArrow
            Layout.alignment: Qt.AlignRight
            icon.source: Constants.icons.arrowRight
            Material.background: "black"
            Material.foreground: "#fff"
            enabled: (quotesSwipe.currentIndex < (quotesSwipe.count - 1))
            onClicked: quotesSwipe.currentIndex++
        }
    }
}


