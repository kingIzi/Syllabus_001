import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import SyLib 1.0

Button{
    id: btn
    Material.background: Material.color(Material.Blue,Material.Shade900)
    Material.foreground: "white"
    text: "Search"
    font: Constants.constantsFonts.actionFont
}
