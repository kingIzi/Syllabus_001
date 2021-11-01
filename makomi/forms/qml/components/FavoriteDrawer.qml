import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.15
import SyLib 1.0


Drawer{
    id: favoriteDialog
    edge: Qt.BottomEdge
    width: syllabusDetailsPage.width
    height: 56
    onClosed: {
        if (height > 56){
            height = 56
        }
    }
    contentItem: Item{
        Popup{
            id: createFavoriteForm
            anchors.centerIn: parent
            contentItem: ColumnLayout{
                Label{
                    text: "New Favorite"
                    Layout.fillWidth: true
                    font: Constants.constantsFonts.secondaryFont
                }
                TextField{
                    Layout.fillWidth: true
                    placeholderText: "Title"
                    font: Constants.constantsFonts.primaryFont
                }
                RowLayout{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Button{
                        text: "Cancel"
                        font: Constants.constantsFonts.primaryFont
                        Material.background: Material.color(Material.LightBlue,Material.Shade700)
                        Material.foreground: "#fff"
                    }
                    Button{
                        text: "create"
                        font: Constants.constantsFonts.primaryFont
                        Material.background: Material.color(Material.LightBlue,Material.Shade700)
                        Material.foreground: "#fff"
                    }
                }
            }
        }

        RowLayout{
            id: favoriteHeaders
            width: parent.width
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
                leftMargin: 8
            }
            IconLabel{
                id: favoriteHeaderLabel
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft
                icon.source: (favoriteDialog.height > 56) ? "" : Constants.icons.checkCircle
                text: (favoriteDialog.height > 56) ? "Save video to" : "Saved to favorites"
                color: Material.color(Material.Green)
                icon.color: Material.color(Material.Green)
                spacing: 2
            }
            Button{
                id: createFavoriteBtn
                visible: true
                Material.background: "transparent"
                Material.foreground: Material.Blue
                Layout.alignment: Qt.AlignRight
                icon.source: Constants.icons.add
                text: "Create Favorite"
                font: Constants.constantsFonts.secondaryFont
                onClicked: {
                    favoriteDialog.height = 400
                    createFavoriteForm.open()
                }
            }
        }
    }
}
