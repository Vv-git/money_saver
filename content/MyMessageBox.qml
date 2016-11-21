import QtQuick 2.0

import QtQuick.Window 2.1 // needed for the Window component

Window {
    id: myMessageBox
    width: Screen.width
    height: Screen.height
    color: "#00E000"
    visible: true
    flags: Qt.SubWindow | Qt.WindowStaysOnTopHint
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
