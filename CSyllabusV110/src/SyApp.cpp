#include "../include/SyApp.h"
#include <QFontDatabase>
#include <QQmlContext>
#include <QtQml>


SyApp::SyApp(int argc, char *argv[]) :
    application(argc,argv)
{
    QGuiApplication::setApplicationName("Syllabus");
    QGuiApplication::setOrganizationName("IziProject");
//    if (QFontDatabase::addApplicationFont("://forms/fonts/fontello.ttf") == -1)
//        qWarning() << "Failed to load fonts";
    this->initialize();
}

void SyApp::initialize()
{
    this->registerTypes();
    this->setContextProperties();
    this->loadQmlObject();
}

void SyApp::setContextProperties()
{
    this->engine.rootContext()->setContextProperty("user",&user);
}

void SyApp::registerTypes()
{
    qmlRegisterSingletonType( QUrl("qrc:/forms/qml/CSyllabusV110/Constants.qml"), "CSyllabusV110", 1, 0, "Constants" );
}

void SyApp::loadQmlObject()
{
    const QUrl url(this->qmlEntry);
    QObject::connect(&this->engine, &QQmlApplicationEngine::objectCreated,
                     &this->application, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    this->engine.load(url);
}

int SyApp::execute()
{
    return this->application.exec();
}


