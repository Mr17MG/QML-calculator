import QtQuick 2.14
import QtQuick.Controls 2.14

Item {
    property alias resultText: resultText
    property alias allLbl: allLbl

    Label{
        id: allLbl
        anchors{
            bottom: parent.bottom
            bottomMargin: 5
            left: parent.left
            leftMargin: 10
        }
    }
    Label {
        id: resultText
        Keys.onPressed: {
            let eventName ;
            switch (event.key) {
            case Qt.Key_Period:eventName = {"text":".","event":"POINT"}
                break;
            case Qt.Key_Slash: eventName = {"text":"/","event":"OPER.DIV"}
                break;
            case Qt.Key_multiply:
            case Qt.Key_Asterisk: eventName = {"text":"*","event":"OPER.STAR"}
                break;
            case Qt.Key_Plus:eventName = {"text":"+","event":"OPER.PLUS"}
                break;
            case Qt.Key_Minus:eventName = {"text":"-","event":"OPER.MINUS"}
                break;
            case Qt.Key_Equal:
            case Qt.Key_Enter:
            case Qt.Key_Return: eventName = {"text":"=","event":"EQUALS"}
                break;
            case Qt.Key_0: eventName =  {"text":"0","event":"DIGIT.0"}
                break;
            case Qt.Key_1: eventName =  {"text":"1","event":"DIGIT.1"}
                break;
            case Qt.Key_2: eventName =  {"text":"2","event":"DIGIT.2"}
                break;
            case Qt.Key_3: eventName =  {"text":"3","event":"DIGIT.3"}
                break;
            case Qt.Key_4: eventName =  {"text":"4","event":"DIGIT.4"}
                break;
            case Qt.Key_5: eventName =  {"text":"5","event":"DIGIT.5"}
                break;
            case Qt.Key_6: eventName =  {"text":"6","event":"DIGIT.6"}
                break;
            case Qt.Key_7: eventName =  {"text":"7","event":"DIGIT.7"}
                break;
            case Qt.Key_8: eventName =  {"text":"8","event":"DIGIT.8"}
                break;
            case Qt.Key_9: eventName =  {"text":"9","event":"DIGIT.9"}
                break;
            }

            if(eventName)
                statemachine.wrapperSubmitEvent(eventName)
        }
        text: ""
        font.pixelSize: window.height * 3 / 32
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors{
            fill: parent
            leftMargin: 10
            rightMargin: 10
        }
    }
}
