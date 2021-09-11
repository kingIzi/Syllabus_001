#include "include/SySchedule.h"

//initialize class get current date
SySchedule::SySchedule(QObject *parent) : QObject(parent)
{

}

SySchedule::~SySchedule()
{

}

QVariantList SySchedule::getDaysOfWeek()
{
    QVariantList daysOfWeek;
    const auto weekDays = 5;
    daysOfWeek.reserve(weekDays);
    for (auto i = 0; i < weekDays; i++){
        daysOfWeek.append(this->gregorianDays[i]);
    }
    return daysOfWeek;
}


