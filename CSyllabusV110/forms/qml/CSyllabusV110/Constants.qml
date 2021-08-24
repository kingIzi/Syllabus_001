pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property int width: 375
    readonly property int height: 812

    readonly property FontLoader mySystemFont: FontLoader { source: "qrc:/forms/fonts/Roboto-Black.ttf" }
    readonly property FontLoader mySystemFont2: FontLoader { source: "qrc:/forms/fonts/Roboto-Light.ttf" }
    readonly property FontLoader fontello: FontLoader { source: "qrc:/forms/fonts/fontello.ttf" }


    readonly property FontLoader robotoBold: FontLoader { source: "qrc:/forms/fonts/Roboto-Bold.ttf" }



    property alias fontDirectory: directoryFontLoader.fontDirectory
    property alias relativeFontDirectory: directoryFontLoader.relativeFontDirectory

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: mySystemFont.name,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: mySystemFont.name,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6,
                                                  letterSpacing: 2
                                              })
    readonly property font largeFont2: Qt.font({
                                                  family: mySystemFont2.name,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6,
                                                  letterSpacing: 2
                                              })

    readonly property font headerFont: Qt.font({
                                                  family: robotoBold.name,
                                                  pixelSize: Qt.application.font.pixelSize * 2,
                                                   bold: true,
                                                   letterSpacing: 4,
                                                   capitalization: Font.AllUppercase
                                              })



    readonly property color backgroundColor: "#efd2c9"

    property DirectoryFontFolder directoryFontLoader: DirectoryFontFolder {
        id: directoryFontLoader
    }
}
