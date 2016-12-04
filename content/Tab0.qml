import QtQuick 2.5
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

Item {
    anchors.fill: parent
    Settings {
        id: settings
        property int money: 730
    }
    ColumnLayout {
        spacing: 40
        width: parent.width
        RowLayout {
            width: parent.width
            anchors.top: parent.top
            anchors.topMargin: maxLen / 30
            anchors.left: parent.left
            anchors.leftMargin: maxLen / 18
            Label {
                id: lbl_money
                wrapMode: Label.Wrap
                text: settings.money + " $"
                font.italic: true
                font.bold: true
                font.family: "Courier"
                font.pixelSize: maxLen / 12
                color: "#33FF99"
            }

        }
        TextField {
            placeholderText: "0"
            implicitWidth: root.width / 2
            validator: IntValidator{bottom: 0}
            font.pixelSize: maxLen / 16
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                radius: 30
                color: "#CCFFCC"
            }
        }
//        ComboBox {
//            model: ["First", "Second", "Third"]
//            width: Math.max(implicitWidth, Math.min(implicitWidth * 2, pane.availableWidth / 3))
//            anchors.horizontalCenter: parent.horizontalCenter
//        }
    }
}
