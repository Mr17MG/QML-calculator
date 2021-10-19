import QtQuick 2.14
import QtQuick.Controls 2.14

ListView{

    clip: true
    model: historyModel
    verticalLayoutDirection:ListView.BottomToTop
    Label{
        anchors.centerIn: parent
        visible: model.count === 0
        text: qsTr("No history!")
        font{
            pixelSize: 26
        }
    }

    delegate: Item {
        width: parent.width
        height: 50
        Label {
            text: model.string
            width: parent.width
            elide: Qt.ElideRight
            opacity: 0.7
            rightPadding: 10
            leftPadding: 10
            font{
                pixelSize: 15
            }
            anchors{
                top: parent.top
            }
        }
        Label{
            text: model.result
            width: parent.width
            elide: Qt.ElideRight
            rightPadding: 10
            leftPadding: 10
            font{
                pixelSize: 20
            }
            anchors{
                bottom: parent.bottom
            }
        }
    }
}

