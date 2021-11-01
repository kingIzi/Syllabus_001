import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtWebEngine 1.8
import SyLib 1.0
import "qrc:/scripts.js" as Scripts

Page {
    id: readingPage
    implicitWidth: root.width
    implicitHeight: root.height
    width: implicitWidth
    height: implicitHeight
    property var book: undefined
    readonly property string filename: "file:///C:/Users/scott/Documents/DEVELOPMENT/c++/cmake_project_builds/makomi/res/technoBat.pdf"
    property string lastNav: ""
    Component.onCompleted: {
        navigationBar.rightItems = undefined
        lastNav = navigationBar.title
        navigationBar.title = "Syllabus name"
    }
    onVisibleChanged: {
        navigationBar.title = lastNav
        navigationBar.rightItems = Scripts.getSearchFilterNavBarRightItems(Constants.icons)
    }
    WebEngineView{
        id: pdfView
        url: filename
        anchors.fill: parent
        settings.pdfViewerEnabled: true
        settings.pluginsEnabled: true
    }
}
