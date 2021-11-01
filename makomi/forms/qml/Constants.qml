pragma Singleton
import QtQuick 2.15

QtObject {
    id: appConstants
    readonly property FontLoader mySystemFont: FontLoader { source: "qrc:/ZenOldMincho-Black.ttf" }
    property DirectoryFontFolder directoryFontLoader: DirectoryFontFolder {
        id: directoryFontLoader
    }

    property alias fontDirectory: directoryFontLoader.fontDirectory
    property alias relativeFontDirectory: directoryFontLoader.relativeFontDirectory

    readonly property QtObject dimensions: QtObject{
        readonly property int appWidth: 411
        readonly property int appMinWidth: 320
        readonly property int appMinHeight: 420
        readonly property int appHeight: 823
    }

    readonly property QtObject constantsFonts: QtObject{
        readonly property real largeFont: 1.6
        readonly property real letterSpacing: 2
        readonly property font primaryFont: Qt.font({
                                                        family: appConstants.mySystemFont.name,
                                                        pixelSize: Qt.application.font.pixelSize,
                                                        letterSpacing: constantsFonts.letterSpacing
                                                    })

        readonly property font secondaryFont: Qt.font({
                                                          family: appConstants.mySystemFont.name,
                                                          pixelSize: Qt.application.font.pixelSize * constantsFonts.largeFont,
                                                          letterSpacing: constantsFonts.letterSpacing,
                                                      })
        readonly property font actionFont: Qt.font({
                                                          family: appConstants.mySystemFont.name,
                                                          pixelSize: Qt.application.font.pixelSize * constantsFonts.largeFont,
                                                          letterSpacing: constantsFonts.letterSpacing,
                                                          capitalization: Font.AllUppercase
                                                      })
    }

    /* Edit this comment to add your custom font */

    readonly property QtObject constantsColors: QtObject{
        readonly property color backgroundColor: "#F3F5F9"
    }

    readonly property var regex: {
        "phoneNumber": /\d{1,11}(?:,\d{1,11})+$/,
        "emailAddress": /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
    }

    readonly property QtObject icons: QtObject{
        readonly property string menu: "qrc:/icons/menu_black_24dp.svg"
        readonly property string search: "qrc:/icons/search_black_24dp.svg"
        readonly property string filter: "qrc:/icons/filter_alt_black_24dp.svg"
        readonly property string arrowBack: "qrc:/icons/arrow_back_black_24dp.svg"
        readonly property string home: "qrc:/icons/home_black_24dp.svg"
        readonly property string psychology: "qrc:/icons/psychology_black_24dp.svg"
        readonly property string quiz: "qrc:/icons/quiz_black_24dp.svg"
        readonly property string accountCircle: "qrc:/icons/account_circle_black_24dp.svg"
        readonly property string bookmark: "qrc:/icons/bookmark_black_24dp.svg"
        readonly property string localLibrary: "qrc:/icons/local_library_black_24dp.svg"
        readonly property string navigateNext: "qrc:/icons/navigate_next_black_24dp.svg"
        readonly property string star: "qrc:/icons/star_black_24dp.svg"
        readonly property string copyright: "qrc:/icons/copyright_black_24dp.svg"
        readonly property string openInNew: "qrc:/icons/open_in_new_black_24dp.svg"
        readonly property string favorite: "qrc:/icons/favorite_black_24dp.svg"
        readonly property string add: "qrc:/icons/add_black_24dp.svg"
        readonly property string checkCircle: "qrc:/icons/check_circle_black_24dp.svg"
        readonly property string edit: "qrc:/icons/edit_black_24dp.svg"
        readonly property string formatQuote: "qrc:/icons/format_quote_black_48dp.svg"
        readonly property string arrowRight: "qrc:/icons/arrow_right_black_24dp.svg"
        readonly property string arrowLeft: "qrc:/icons/arrow_left_black_24dp.svg"
        readonly property string photoCamera: "qrc:/icons/photo_camera_black_24dp.svg"
        readonly property string person: "qrc:/icons/person_black_24dp.svg"
        readonly property string lock: "qrc:/icons/lock_black_24dp.svg"
        readonly property string paid: "qrc:/icons/paid_black_24dp.svg"
        readonly property string menuBook: "qrc:/icons/menu_book_black_24dp.svg"
    }

    readonly property QtObject images: QtObject{
        readonly property string logo: "qrc:/images/dummyLogo.png"
    }

}
