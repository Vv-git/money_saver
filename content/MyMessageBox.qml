import QtQuick 2.0

import QtQuick.Window 2.1 // needed for the Window component

Window {
    id: myMessageBox
    width: Screen.width/2
    height: Screen.height/3
    visible: true
    Rectangle {
        anchors.fill: parent
        color: "#000000"
        Text {
            anchors.centerIn: parent
            text: "My New Window"
            color: "#FFFFFF"
        }
    }
}
