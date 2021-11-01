import QtQuick 2.15
import SyLib 1.0
import "qrc:/scripts.js" as Scripts

ListModel{
    id: sideNavListModel
    readonly property var icons: [Constants.icons.home,Constants.icons.psychology,Constants.icons.quiz,Constants.icons.accountCircle]
    readonly property var labels: ["Home","History","Top Quiz","My Account"]
    Component.onCompleted: {
//        for (let i = 0; i < labels.length; i++){
//            sideNavListModel.append({"iconImage": icons[i],"label": labels[i]})
//        }
        Scripts.appendSideNavListModel(sideNavListModel,Constants.icons)
    }
}
