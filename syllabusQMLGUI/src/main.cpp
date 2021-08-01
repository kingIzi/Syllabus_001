#include <QGuiApplication>
#include <QFontDatabase>
#include <QQmlApplicationEngine>
#include <QFile>


int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("Syllabus");
    QGuiApplication::setOrganizationName("IziProject");
    QGuiApplication app(argc, argv);
    if (QFontDatabase::addApplicationFont("://forms/fonts/fontello.ttf") == -1)
        qWarning() << "Failed to load fonts";
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/forms/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}

