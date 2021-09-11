import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material.impl 2.15


ListView{
    id: syPosterListView
    property int posterModel: 10
    spacing: 10
    width: parent.width
    height: parent.height
    model: syPosterListView.posterModel
    clip: true
    orientation: ListView.Horizontal
}
