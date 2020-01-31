#ifndef FAN_CONTROLS_H
#define FAN_CONTROLS_H

class fanControls //: public QObject()
{
private:
    int fanLevel;
    int temperatureLevel;
    int modeLevel;

public:
    fanControls();
    void allAutoSelected();

};

#endif // FAN_CONTROLS_H
