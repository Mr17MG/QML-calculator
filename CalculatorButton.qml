import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14

Item{
    Button {
        height: parent.height
        width: height
        text: modelData.text
        flat: true

        anchors.centerIn: parent

        font{
            pixelSize: 20
            bold: true
        }

        Material.foreground: switch (text) {
                             case "AC":
                             case "+/-":
                             case "%":
                                 return Material.Cyan

                             case "/":
                             case "*":
                             case "+":
                             case "-":
                             case "=":
                                 return Material.color(Material.Orange)

                             case ".":
                             default:
                                 return Material.primaryTextColor
                             }

        onClicked: statemachine.wrapperSubmitEvent(modelData)
    }
}
