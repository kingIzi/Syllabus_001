import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import SyLib 1.0


ColumnLayout{
    Rectangle{
        Layout.fillWidth: true
        Layout.preferredHeight: 1
        Layout.maximumHeight: 1
        color: Material.color(Material.Grey,Material.Shade600)
    }
    RowLayout{
        Layout.fillWidth: true
        Layout.fillHeight: true
        IconImage{
            source: Constants.icons.copyright
        }
        Label{
            id: copyrightText
            text: qsTr("All book publications are school property. Copying and publishing books is prohibited.")
            Layout.fillWidth: true
            wrapMode: Label.WordWrap
            padding: 20
            horizontalAlignment: Label.AlignHCenter
        }
    }
}


