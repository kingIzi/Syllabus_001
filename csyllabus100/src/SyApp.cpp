#include "../include/SyApp.h"
#include <QFontDatabase>
#include <QQmlContext>


SyApp::SyApp(int argc, char *argv[]) :
    application(argc,argv)
{
    QGuiApplication::setApplicationName("Syllabus");
    QGuiApplication::setOrganizationName("IziProject");
    if (QFontDatabase::addApplicationFont("://forms/fonts/fontello.ttf") == -1)
        qWarning() << "Failed to load fonts";
    this->initialize();
}

void SyApp::initialize()
{
    const QUrl url(this->qmlEntry);
    QObject::connect(&this->engine, &QQmlApplicationEngine::objectCreated,
                     &this->application, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    this->setContextProperties();
    this->engine.load(url);
}

void SyApp::setContextProperties()
{
    this->engine.rootContext()->setContextProperty("user",&user);
}

int SyApp::execute()
{
    return this->application.exec();
}


