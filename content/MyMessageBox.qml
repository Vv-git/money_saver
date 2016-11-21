import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.1 // needed for the Window component

Window {
    id: myMessageBox
    width: Screen.width
    height: Screen.height
    visible: true
    flags: Qt.SubWindow | Qt.WindowStaysOnTopHint
    TabView {
        anchors.fill: parent
        Tab {
            title: "tab1"
            Rectangle {
                anchors.fill: parent
                Text {
                    anchors.centerIn: parent
                    text: "Tab 1"
                    color: "#FFFFFF"
                }
            }
        }
        Tab {
            title: "tab2"
            Rectangle {
                anchors.fill: parent
                Text {
                    anchors.centerIn: parent
                    text: "Tab 2"
                    color: "#FFFFFF"
                }
            }
        }
    }
}
