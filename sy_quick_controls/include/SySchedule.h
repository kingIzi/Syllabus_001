#pragma once
#include <QDateTime>
#include <QDate>
#include <QList>

class SySchedule : public QObject{
    Q_OBJECT
public:
    explicit SySchedule(QObject * parent = nullptr);
    ~SySchedule();
public slots:
    QVariantList getDaysOfWeek();
private:
    const QList<QString> gregorianDays = {"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
    const QList<QString> gregorianMonths = {"January","February","March","April","May","June","July","August","September","October","November","December"};
};
