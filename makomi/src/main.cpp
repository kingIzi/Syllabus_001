#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngineQuick/QtWebEngineQuick>
#include <QtWebEngineCore/QWebEngineSettings>
#include <QLocale>
#include <QTranslator>

const char* singleton = "qrc:/forms/qml/Constants.qml";
const auto qml = "qrc:/forms/qml/main.qml";


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QtWebEngineQuick::initialize();
    QGuiApplication app(argc, argv);
    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "makomi_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;
    qmlRegisterSingletonType(QUrl(singleton), "SyLib", 1, 0, "Constants");
    //const QUrl url(QStringLiteral("qrc:/forms/qml/main.qml"));
    const QUrl url(qml);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
