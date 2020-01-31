#include <iostream>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlProperty>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQuickItem>
#include <QQmlContext>
#include <QQuickView>
#include "backend.h"

BackEnd::BackEnd(QObject *parent) : QObject(parent)
{

}

void BackEnd::allAutoClicked(){
    if (allAutoSelected == false){
        allAutoSelected = true;
        setFanAutoSelected(true);
        setModeAutoSelected(true);
        setTempAutoSelected(true);
    }
    else allAutoSelected = false;

    std::cout << "All Auto Clicked: " << allAutoSelected << std::endl;
    emit fullAutoChanged();
}

void BackEnd::setAllAutoSelected(bool entBool){
    allAutoSelected = entBool;
    emit fullAutoChanged();
}

bool BackEnd::getFullAutoSelected(){
    return allAutoSelected;
}

void BackEnd::fanAutoClicked(){
    if (fanAutoSelected == true){
        fanAutoSelected = false;
        setAllAutoSelected(false);
    }
    else fanAutoSelected = true;
    std::cout << "Fan Auto Clicked" << std::endl;
    emit fanAutoChanged();
}

bool BackEnd::getFanAutoSelected(){
    return fanAutoSelected;
}

void BackEnd::setFanAutoSelected(bool entBool){
    fanAutoSelected = entBool;
    emit fanAutoChanged();
}

int BackEnd::getFanLevel(){
    return fanLevel;
}

void BackEnd::setFanLevel(int entLev){
    fanLevel = entLev;
    emit fanLevelChanged();
}

void BackEnd::fanLevelClicked(int entLevel){   //entLevel assumed to be 0-4
    fanLevel = entLevel;
    std::cout << "Fan level is now: " << fanLevel << std::endl;
    emit fanLevelChanged();
}

void BackEnd::modeAutoClicked(){
    if (modeAutoSelected == true){
        modeAutoSelected = false;
        setAllAutoSelected(false);
    }
    else modeAutoSelected = true;
    std::cout << "Mode Auto Clicked" << std::endl;
    emit modeAutoChanged();
}

bool BackEnd::getModeAutoSelected(){
    return modeAutoSelected;
}

void BackEnd::setModeAutoSelected(bool entBool){
    modeAutoSelected = entBool;
    emit modeAutoChanged();
}

void BackEnd::modeLevelClicked(int entMode){
    modeLevel = entMode;
    std::cout << "Mode level is now: " << modeLevel << std::endl;
}

void BackEnd::setModeLevel(int entModeLev){
    modeLevel = entModeLev;
    std::cout << "Mode level is now: " << modeLevel << std::endl;
    emit modeLevelChanged();
}

int BackEnd::getModeLevel(){
    return modeLevel;
}

void BackEnd::tempAutoClicked(){
    if (tempAutoSelected == true){
        tempAutoSelected = false;
        setAllAutoSelected(false);
    }
    else tempAutoSelected = true;
    std::cout << "Temp Auto Clicked" << std::endl;
    emit tempAutoChanged();
}

bool BackEnd::getTempAutoSelected(){
    return tempAutoSelected;
}

void BackEnd::setTempAutoSelected(bool entBool){
    tempAutoSelected = entBool;
    emit tempAutoChanged();
}

int BackEnd::getTempLevel(){
    return tempLevel;
}

void BackEnd::setTempLevel(int entTempLev){
    tempLevel = entTempLev;
    std::cout << "Temp level is now: " << tempLevel << std::endl;
    emit tempLevelChanged();
}

void BackEnd::targTempLower(){
    targetTemp--;
    std::cout << "Target temp is now: " << targetTemp << std::endl;
    emit targetTempChanged();
}

void BackEnd::targTempRaise(){
    targetTemp++;
    std::cout << "Target temp is now: " << targetTemp << std::endl;
    emit targetTempChanged();
}

QString BackEnd::getTargetTemp(){
    QString theString;
    theString += QString::number(targetTemp);
    theString += "°";
    return theString;
}

QString BackEnd::getCurrentTemp(){
    QString theString;
    theString += QString::number(currentTemp);
    theString += "°";
    return theString;
}

void BackEnd::autoEngageSettings(){
    // ------fan auto settings------
    if (fanAutoSelected == true){
        if (abs(targetTemp-currentTemp) >= 10)
            setFanLevel(4);
        else if (abs(targetTemp-currentTemp) >= 5)
            setFanLevel(3);
        else if (abs(targetTemp-currentTemp) >= 3)
            setFanLevel(2);
        else
            setFanLevel(1);
    }

    //----- mode auto settings ------
    if (modeAutoSelected == true){
        //---if it's too cold---
        //  Blow from feet
        if (currentTemp >= targetTemp)
            setModeLevel(0);
        //---if it's too hot---
        //  Blow from feet
        else
            setModeLevel(2);
    }


    //  ------temperature auto settings-------
    if (tempAutoSelected == true){
        //---if it's too cold----
        if (currentTemp <= targetTemp){
            //if the temperature is off by 6 degrees, full heat
            if ((targetTemp-currentTemp) >= 6)
                setTempLevel(4);
            //if the temperature is off by 2 degrees, back off the heat just a little
            else if ((targetTemp-currentTemp) >= 2)
                setTempLevel(3);
            //if the temperature is within 1 degrees of target, maintain.
            else if ((targetTemp-currentTemp) >= 0)
                setTempLevel(2);
        }

        //---if it's too hot---
        if (currentTemp > targetTemp){
            //if the temperature is off by 5 degrees, full AC
            if ((currentTemp-targetTemp) >= 5)
                setTempLevel(0);
            //if the temperature is off by 2 degrees, back off the a/c a little
            else if ((currentTemp-targetTemp) >= 2)
                setTempLevel(1);
            //if the temperature is within 1 degree, maintain.
            else if ((currentTemp-targetTemp) >= 0)
                setTempLevel(2);
        }

    }
}
