#pragma once
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "../include/User.h"


class SyApp{
private:
    QGuiApplication application;
    QQmlApplicationEngine engine;
    const char* qmlEntry = "qrc:/forms/qml/main.qml";
    struct User user;
private:
    void initialize();
    void setContextProperties();
    void registerTypes();
    void loadQmlObject();
public:
    SyApp(int argc,char* argv[]);
    int execute();
};
