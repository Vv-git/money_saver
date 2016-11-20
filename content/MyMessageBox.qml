import QtQuick 2.0

import QtQuick.Window 2.1 // needed for the Window component

Window {
    width: Screen.width/2
    height: Screen.height/4

    Rectangle {
        anchors.fill: parent
        color: "lightGrey"
        Text {
            anchors.centerIn: parent
            text: "My New Window"
        }
    }
}
