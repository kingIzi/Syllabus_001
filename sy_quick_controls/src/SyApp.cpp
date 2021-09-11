#include "include/SyApp.h"
#include "include/SyHighlighter.h"
#include "include/SySchedule.h"



SyApp::SyApp(int argc, char *argv[]) :
    application(argc, argv)
{
    QGuiApplication::setApplicationName("Syllabus");
    QGuiApplication::setOrganizationName("IziProject");
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
    this->engine.rootContext()->setContextProperty("user", &user);
}

void SyApp::registerTypes()
{
    qmlRegisterSingletonType(QUrl(this->qmlSingleton), "Syllabus10", 1, 0, "Constants");
    qmlRegisterType<SyHighlighter>("Syllabus", 1, 0, "SyHighlighter"); //Highlighting text
    qmlRegisterType<SySchedule>("Schedule",1,0,"SySchedule"); //calendar and scheduling
}

void SyApp::loadQmlObject()
{
    const QUrl url(this->qmlEntry);
    QObject::connect(&this->engine, &QQmlApplicationEngine::objectCreated,
    &this->application, [url](QObject * obj, const QUrl & objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    this->engine.load(url);
}

int SyApp::execute()
{
    return this->application.exec();
}
