import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14

import QtScxml 5.14
import CalculatorStateMachine 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 650
    minimumHeight: 400
    minimumWidth: 350

    Material.theme: Material.Dark
    Material.background: Material.theme === Material.Dark ? "#22252D"
                                                          : "#FFFFFF"
    TabBar{
        id:tabbar
        anchors{
            horizontalCenter: parent.horizontalCenter
        }
        onCurrentIndexChanged: {
            window.Material.theme = currentIndex === 0 ? Material.Dark: Material.Light
            displayArea.resultText.forceActiveFocus()
        }
        background: Rectangle{
            color: Material.theme === Material.Dark? "#292D36"
                                                   : "#F9F9F9"
            radius: 30
            width: parent.width+20
            anchors.centerIn: parent
        }
        Material.accent: "transparent"
        TabButton{
            checked: window.Material.theme === Material.Dark
            hoverEnabled: false
            icon{
                source:"qrc:/images/moon.svg"
                color: tabbar.currentIndex === 0 ?Material.primaryTextColor:Material.iconDisabledColor
            }
        }
        TabButton{
            checked: window.Material.theme === Material.Light
            hoverEnabled: false
            icon{
                source:"qrc:/images/sun.svg"
                color: tabbar.currentIndex === 1 ?Material.primaryTextColor:Material.iconDisabledColor
            }
        }
    }

    RoundButton{
        flat: true
        icon{
            source: keypadDrawer.visible ? "qrc:/images/history.svg"
                                         : "qrc:/images/calculator.svg"
        }
        anchors{
            top: parent.top
            left: parent.left
        }
        onClicked: {
            keypadDrawer.visible = !keypadDrawer.visible
            displayArea.resultText.forceActiveFocus()
        }
    }

    Display {
        id: displayArea
        height: parent.height * 3 / 8 - 10
        width: parent.width

    }

    Drawer {
        id: keypadDrawer
        visible: true
        height: parent.height - displayArea.height
        width: parent.width
        edge: Qt.BottomEdge
        modal: false
        closePolicy: Drawer.NoAutoClose
        dragMargin:30

        background: Rectangle{
            color: window.Material.theme === Material.Dark? "#292D36"
                                                          : "#F9F9F9"
            radius: 30
            height: parent.height + 60
            anchors {
                topMargin: -10
            }
            Rectangle{
                width: parent.width/2
                height: 3
                radius: 50
                opacity: 0.5
                color: Material.theme != Material.Dark ? "#161e34"
                                                       : "#FDFDFD"
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 10
                }
            }
        }

        Keypad{
            anchors{
                fill: parent
                topMargin: 20
            }
        }
    }

    History{
        ListModel{ id: historyModel }
        height: parent.height - displayArea.height
        width: parent.width
        anchors{
            bottom: parent.bottom
        }
    }


    CalculatorStateMachine {
        id: statemachine
        running: true
        property bool isEqual: false
        function wrapperSubmitEvent(eventObj){
            submitEvent(eventObj.event)
            if( eventObj.text === "AC" || eventObj.text === "=")
            {
                historyModel.insert(0,{"string":displayArea.allLbl.text})
                isEqual = true
                displayArea.allLbl.text=""
            }
            else
                displayArea.allLbl.text += eventObj.text
        }

        EventConnection {
            events: ["updateDisplay"]
            onOccurred: {
                displayArea.resultText.text = event.data.display
                if(statemachine.isEqual){
                    historyModel.set(0,{"result":Number(event.data.display)})
                    statemachine.isEqual = false
                }

                displayArea.resultText.forceActiveFocus()
            }
        }
    }

}
