#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>

class BackEnd : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString targetTemperature READ getTargetTemp NOTIFY targetTempChanged)
    Q_PROPERTY(QString currentTemperature READ getCurrentTemp NOTIFY currentTempChanged)
    Q_PROPERTY(int fanLevel READ getFanLevel WRITE setFanLevel NOTIFY fanLevelChanged)
    Q_PROPERTY(int tempLevel READ getTempLevel WRITE setTempLevel NOTIFY tempLevelChanged)
    Q_PROPERTY(int modeLevel READ getModeLevel WRITE setModeLevel NOTIFY modeLevelChanged)
    Q_PROPERTY(bool allAutoSelected READ getFullAutoSelected NOTIFY fullAutoChanged)
    Q_PROPERTY(bool fanAutoSelected READ getFanAutoSelected WRITE setFanAutoSelected NOTIFY fanAutoChanged)
    Q_PROPERTY(bool tempAutoSelected READ getTempAutoSelected WRITE setTempAutoSelected NOTIFY tempAutoChanged)
    Q_PROPERTY(bool modeAutoSelected READ getModeAutoSelected WRITE setModeAutoSelected NOTIFY modeAutoChanged)


    int fanLevel; // 0-4
    int modeLevel; // 0-4
    int tempLevel; // 0-4,     COLD 0 1 2 3 4 HOT
    int targetTemp = 69;
    int currentTemp = 75;
    bool allAutoSelected = false, fanAutoSelected = false, modeAutoSelected = false, tempAutoSelected = false;


public:
    explicit BackEnd(QObject *parent = nullptr);
    Q_INVOKABLE void autoEngageSettings();

signals:
    void targetTempChanged();
    void currentTempChanged();
    void fanLevelChanged();
    void tempLevelChanged();
    void modeLevelChanged();
    void fullAutoChanged();
    void fanAutoChanged();
    void tempAutoChanged();
    void modeAutoChanged();

public slots:
    void allAutoClicked();
    void fanAutoClicked();
    void fanLevelClicked(int entLevel);
    void modeAutoClicked();
    void modeLevelClicked(int entLevel);
    void tempAutoClicked();
    void targTempRaise();
    void targTempLower();
    //void autoEngageSettings();

private:
    QString getTargetTemp();
    QString getCurrentTemp();
    int getTempLevel();
    int getModeLevel();
    int getFanLevel();
    bool getTempAutoSelected();
    bool getModeAutoSelected();
    bool getFanAutoSelected();
    bool getFullAutoSelected();
    void setTempAutoSelected(bool entBool);
    void setTempLevel(int entTempLev);
    void setFanLevel(int entLev);
    void setModeLevel(int entModeLev);
    void setModeAutoSelected(bool entBool);
    void setFanAutoSelected(bool entBool);
    void setAllAutoSelected(bool entBool);

};


#endif // BACKEND_H
