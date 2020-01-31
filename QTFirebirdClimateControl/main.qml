import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.5
import backend 1.0

Window {
    id: window
    visible: true
    width: 800
    height: 480
    color: "#000000"
    title: qsTr("Hello World")

    BackEnd {
        id: backend
        onTargetTempChanged: {
            targetTempText.text = targetTemperature
        }
        onCurrentTempChanged: {
            currentTempText.text = currentTemperature
        }

        onFanLevelChanged: {
            if (fanLevel >= 4) fanLevel4.opacity = 1.0
            else fanLevel4.opacity = 0.4
            if (fanLevel >= 3) fanLevel3.opacity = 1.0
            else fanLevel3.opacity = 0.4
            if (fanLevel >= 2) fanLevel2.opacity = 1.0
            else fanLevel2.opacity = 0.4
            if (fanLevel >= 1) fanLevel1.opacity = 1.0
            else fanLevel1.opacity = 0.4
            if (fanLevel == 0) fanLevel0.opacity = 1.0
            else fanLevel0.opacity = 0.4
        }
        onTempLevelChanged: {
            if (tempLevel == 0) tempButton1.opacity = 1.0
            else tempButton1.opacity = 0.4
            if (tempLevel == 1) tempButton2.opacity = 1.0
            else tempButton2.opacity = 0.4
            if (tempLevel == 2) tempButton3.opacity = 1.0
            else tempButton3.opacity = 0.4
            if (tempLevel == 3) tempButton4.opacity = 1.0
            else tempButton4.opacity = 0.4
            if (tempLevel == 4) tempButton5.opacity = 1.0
            else tempButton5.opacity = 0.4
        }
        onModeLevelChanged: {
            if (modeLevel == 0) modeV.opacity = 1.0
            else modeV.opacity = 0.4
            if (modeLevel == 1) modeVF.opacity = 1.0
            else modeVF.opacity = 0.4
            if (modeLevel == 2) modeF.opacity = 1.0
            else modeF.opacity = 0.4
            if (modeLevel == 3) modeFD.opacity = 1.0
            else modeFD.opacity = 0.4
            if (modeLevel == 4) modeD.opacity = 1.0
            else modeD.opacity = 0.4
        }
        onFullAutoChanged: {
            if (allAutoSelected == false) allAutoSelect.opacity = 0.4
            else allAutoSelect.opacity = 1.0
        }
        onModeAutoChanged: {
            if (modeAutoSelected == false) modeAutoSelect.opacity = 0.4
            else modeAutoSelect.opacity = 1.0
        }
        onFanAutoChanged: {
            if (fanAutoSelected == false) fanAutoSelect.opacity = 0.4
            else fanAutoSelect.opacity = 1.0
        }
        onTempAutoChanged: {
            if (tempAutoSelected == false) tempAutoSelect.opacity = 0.4
            else tempAutoSelect.opacity = 1.0
        }
    }
    //-----------------------timer---------------------------------------------------------
    Item {
        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: backend.autoEngageSettings()
        }
    }

    Text {
        id: headerLabel
        x: 0
        y: 0
        width: 800
        height: 35
        color: "#ffffff"
        text: qsTr(" Climate Control")
        font.bold: true
        fontSizeMode: Text.FixedSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 22
    }


    ColumnLayout {
        id: targetTempLayout
        x: 294
        y: 35
        width: 212
        height: 177
        anchors.horizontalCenterOffset: 0
        spacing: 0
        anchors.horizontalCenter: parent.horizontalCenter


        Button {
            id: allAutoSelect
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            background: Rectangle {
                        color: "black"
                    }
            opacity: 0.4
            contentItem: Text {
                color: "#ff0000"
                text: qsTr("Auto")
                font.bold: true
                font.pixelSize: 31
                }
        }

        RowLayout {
            id: targetTempButtonsLayout
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Button {
                id: targetTempLower
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                background: Rectangle {
                            color: "black"
                        }
                contentItem: Text {
                    color: "#ff9900"
                    text: qsTr("<")
                    font.bold: false
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 50
                    }
            }

            Text {
                id: targetTempText
                objectName: "targetTempText"
                color: "#ffffff"
                text: backend.targetTemperature
                //text: qsTr("69°")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 80
            }

            Button {
                id: targetTempHigher
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                background: Rectangle {
                            color: "black"
                        }
                contentItem: Text {
                    color: "#ff9900"
                    text: qsTr(">")
                    font.bold: false
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 50
                    }
            }
        }

        Text {
            id: targetTempLabel
            color: "#00ff00"
            text: qsTr("Target")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
            opacity: 0.9
            font.pixelSize: 28
        }

    }

    ColumnLayout {
        id: currentTempLayout
        y: 237
        spacing: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: currentTempText
            color: "#ffffff"
            text: backend.currentTemperature
            //text: qsTr("50°")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 45
        }

        Text {
            id: currentTempLabel
            color: "#00ff00"
            text: qsTr("Current")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
        }
    }




    RowLayout {
        id: tempSelLayout
        y: 90
        anchors.right: parent.right
        anchors.rightMargin: 10

        Button {
            id: tempAutoSelect
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            background: Rectangle {
                        color: "black"
                    }
            contentItem: Text {
                color: "#ff0000"
                text: qsTr("Auto")
                font.bold: true
                font.pixelSize: 31
                }
            opacity: 0.4
        }

        ColumnLayout {
            id: tempSelLayoutTwo

            Text {
                id: tempLabel
                color: "#ffffff"
                text: qsTr("Temp")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                opacity: 1
                font.pixelSize: 28
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }

            RowLayout {
                id: tempSelLayoutThree
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                ColumnLayout {
                    id: tempButtonsLayout
                    Layout.preferredHeight: 200
                    Layout.preferredWidth: 25
                    spacing: 34

                    Button {
                        id: tempButton5
                        background: Rectangle {
                            color: "#00ff00"
                        }
                        Layout.preferredHeight: 12
                        Layout.preferredWidth: 25
                        opacity: 0.4
                    }

                    Button {
                        id: tempButton4
                        background: Rectangle {
                            color: "#00ff00"
                        }
                        Layout.preferredHeight: 12
                        Layout.preferredWidth: 25
                    }

                    Button {
                        id: tempButton3
                        background: Rectangle {
                            color: "#00ff00"
                        }
                        Layout.preferredHeight: 12
                        Layout.preferredWidth: 25
                        opacity: 0.4
                    }

                    Button {
                        id: tempButton2
                        background: Rectangle {
                            color: "#00ff00"
                        }
                        Layout.preferredHeight: 12
                        Layout.preferredWidth: 25
                        opacity: 0.4
                    }

                    Button {
                        id: tempButton1
                        background: Rectangle {
                            color: "#00ff00"
                        }
                        Layout.preferredHeight: 12
                        Layout.preferredWidth: 25
                        opacity: 0.4
                    }
                }

                Image {
                    id: hotcoldGradient
                    Layout.preferredHeight: 200
                    Layout.preferredWidth: 35
                    sourceSize.width: 35
                    sourceSize.height: 200
                    fillMode: Image.PreserveAspectFit
                    source: "../images/HotColdGradient.jpg"
                }
            }
        }
    }

    ColumnLayout {
        id: modeLayout
        x: 11
        y: 335
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Button {
            id: modeAutoSelect
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            background: Rectangle {
                        color: "black"
                    }
            contentItem: Text {
                color: "#ff0000"
                text: qsTr("Auto")
                font.bold: true
                font.pixelSize: 31
                }
            opacity: 0.4
        }

        RowLayout {
            id: modeButtonsLayout
            Layout.preferredHeight: 90
            Layout.preferredWidth: 778
            spacing: 30

            Image {
                id: modeV
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 90
                Layout.preferredWidth: 90
                opacity: 0.4
                source: "../images/modeV.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: backend.modeLevel = 0
                }
            }

            Image {
                id: modeVF
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 90
                Layout.preferredWidth: 90
                opacity: 0.4
                source: "../images/modeVF.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: backend.modeLevel = 1
                }

            }

            Image {
                id: modeF
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 90
                Layout.preferredWidth: 90
                source: "../images/modeF.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: backend.modeLevel = 2
                }

            }

            Image {
                id: modeFD
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 90
                Layout.preferredWidth: 90
                opacity: 0.4
                source: "../images/modeFD.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: backend.modeLevel = 3
                }
            }

            Image {
                id: modeD
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 90
                Layout.preferredWidth: 90
                opacity: 0.4
                source: "../images/modeD.png"
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: backend.modeLevel = 4
                }
            }
        }
    }

    RowLayout {
        id: fanLayout
        y: 90
        anchors.left: parent.left
        anchors.leftMargin: 10

        ColumnLayout {
            id: fanButtonLayout

            Text {
                id: fanLabel
                color: "#ffffff"
                text: qsTr("Fan")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pixelSize: 28
                opacity: 1
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }

            ColumnLayout {
                id: fanButtonsLayoutTwo
                Layout.preferredHeight: 200
                Layout.preferredWidth: 100

                Button {
                    id: fanLevel4
                    background: Rectangle {
                        color: "#7fb3ff"
                    }
                    Layout.preferredHeight: 15
                    Layout.preferredWidth: 100
                }

                Button {
                    id: fanLevel3
                    background: Rectangle {
                        color: "#7fb3ff"
                    }
                    Layout.preferredHeight: 15
                    Layout.preferredWidth: 75
                }

                Button {
                    id: fanLevel2
                    background: Rectangle {
                        color: "#7fb3ff"
                    }
                    Layout.preferredHeight: 15
                    Layout.preferredWidth: 50
                }

                Button {
                    id: fanLevel1
                    background: Rectangle {
                        color: "#7fb3ff"
                    }
                    Layout.preferredHeight: 15
                    Layout.preferredWidth: 25
                }

                Button {
                    id: fanLevel0
                    background: Rectangle {
                        color: "#ff0000"
                    }
                    Layout.preferredHeight: 15
                    Layout.preferredWidth: 100
                    opacity: 0.4
                }
            }
        }

        Button {
            id: fanAutoSelect
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            background: Rectangle {
                        color: "black"
                    }
            contentItem: Text {
                color: "#ff0000"
                text: qsTr("Auto")
                font.bold: true
                font.pixelSize: 31
                }
            opacity: 0.4
        }
    }

    Connections {
        target: fanAutoSelect
        onClicked: backend.fanAutoClicked()
    }

    Connections {
        target: allAutoSelect
        onClicked: backend.allAutoClicked()
    }

    Connections {
        target: tempAutoSelect
        onClicked: backend.tempAutoClicked()
    }

    Connections {
        target: modeAutoSelect
        onClicked: backend.modeAutoClicked()
    }

    Connections {
        target: fanLevel0
        onClicked: backend.fanLevelClicked(0)
    }
    Connections {
        target: fanLevel1
        onClicked: backend.fanLevelClicked(1)
    }
    Connections {
        target: fanLevel2
        onClicked: backend.fanLevelClicked(2)
    }
    Connections {
        target: fanLevel3
        onClicked: backend.fanLevelClicked(3)
    }
    Connections {
        target: fanLevel4
        onClicked: backend.fanLevelClicked(4)
    }

    Connections {
        target: tempButton1
        onClicked: backend.tempLevel = 0
    }
    Connections {
        target: tempButton2
        onClicked: backend.tempLevel = 1
    }
    Connections {
        target: tempButton3
        onClicked: backend.tempLevel = 2
    }
    Connections {
        target: tempButton4
        onClicked: backend.tempLevel = 3
    }
    Connections {
        target: tempButton5
        onClicked: backend.tempLevel = 4
    }

    Connections {
        target: targetTempHigher
        onClicked: backend.targTempRaise()
    }
    Connections {
        target: targetTempLower
        onClicked: backend.targTempLower()
    }

}

/*##^## Designer {
    D{i:34;anchors_x:10}D{i:35;anchors_x:10}D{i:33;anchors_x:10}D{i:37;anchors_x:10}D{i:38;anchors_x:10}
D{i:39;anchors_x:10}D{i:40;anchors_x:10}D{i:41;anchors_x:10}D{i:36;anchors_x:10}D{i:32;anchors_x:10}
D{i:42;anchors_x:10}
}
 ##^##*/
