import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0
import QtQuick.Window 2.1

Item {
    width: parent.width
    height: parent.height
    Settings {
        id: settings
        property int money: 730
    }
    Column {
        spacing: 40
        width: parent.width
        Row {
            width: parent.width
//            anchors.leftMargin: Screen.width / 20
//            anchors.topMargin: Screen.height / 20
            Label {
                wrapMode: Label.Wrap
                horizontalAlignment: Qt.AlignLeft
                anchors.bottom: parent.bottom
                text: settings.money
                font.pixelSize: root.width / 10
                color: "#33FF99"
            }
            Label {
                wrapMode: Label.Wrap
                horizontalAlignment: Qt.AlignLeft
                anchors.bottom: parent.bottom
                text: " $"
                font.pixelSize: root.width / 14
                color: "#33FF99"
            }

        }
        TextField {
            placeholderText: "0"
            width: root.width / 2
            font.pixelSize: root.width / 16
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                radius: 30
                color: "#CCFFCC"
            }
        }
    }
}
