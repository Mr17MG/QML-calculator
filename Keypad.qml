import QtQuick 2.14

Item{
    Flow{
        id:flow1
        flow: Flow.TopToBottom
        height: parent.height
        width: parent.width / 4
        anchors{
            left: flow2.right
        }
        Repeater {
            model: [
                {"text":"/","event":"OPER.DIV"},
                {"text":"*","event":"OPER.STAR"},
                {"text":"+","event":"OPER.PLUS"},
                {"text":"-","event":"OPER.MINUS"},
                {"text":"=","event":"EQUALS"}
            ]

            CalculatorButton{
                width: parent.width
                height:parent.height / 5
            }
        }
    }

    Flow{
        id:flow2

        flow: Flow.LeftToRight
        width: parent.width / 4 * 3
        height: parent.height
        Repeater {
            id: digits
            model: [
                {"text":"7","event":"DIGIT.7"}, {"text":"8","event":"DIGIT.8"}, {"text":"9","event":"DIGIT.9"},
                {"text":"4","event":"DIGIT.4"}, {"text":"5","event":"DIGIT.5"}, {"text":"6","event":"DIGIT.6"},
                {"text":"1","event":"DIGIT.1"}, {"text":"2","event":"DIGIT.2"}, {"text":"3","event":"DIGIT.3"},
                {"text":"AC","event":"C"},      {"text":"0","event":"DIGIT.0"}, {"text":".","event":"POINT"},
            ]

            CalculatorButton{
                width: parent.width / 3
                height:parent.height / 4
            }
        }
    }
}
