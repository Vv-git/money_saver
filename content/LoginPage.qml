import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    color: "#00E000"

    Image {
        source: "qrc:images/login_money.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height / 2 - height
    }

    Grid {
        id: buttons
        columns: 1
        rowSpacing: g_maxLen / 36
        anchors.bottom: parent.bottom
        anchors.bottomMargin: g_maxLen / 10
        anchors.horizontalCenter: parent.horizontalCenter

        TextField {
            id: textField
            placeholderText: "login name"
            width: g_maxLen * 0.7
            font.pixelSize: g_maxLen / 16
            background: Rectangle {
                radius: 10
                border.color: "#FFFFFF"
                border.width: 2
            }
        }
        TextField {
            placeholderText: "password"
            echoMode: "Password"
            width: textField.width
            font: textField.font
            background: Rectangle {
                radius: 10
                border.color: "#FFFFFF"
                border.width: 2
            }
        }
        Button {
            text: "Login"
            width: textField.width
            height: textField.height
            font: textField.font
            onClicked: {
                root.replace("qrc:/content/tabs.qml")
            }
            background: Rectangle {
                radius: 10
                color: "#00CC00"
                border.color: "#FFFFFF"
                border.width: 2
            }
        }
    }
}
