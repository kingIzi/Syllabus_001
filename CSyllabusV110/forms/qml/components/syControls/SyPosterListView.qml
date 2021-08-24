import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material.impl 2.15


ListView{
    id: syPosterListView
    property var posterModel: [1,2,3,4,5,6,7,8,9,0]
    spacing: 10
    width: parent.width
    height: parent.height
    model: syPosterListView.posterModel
    clip: true
    orientation: ListView.Horizontal
}
