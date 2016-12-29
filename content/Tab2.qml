import QtQml 2.2
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "Database.js" as Db

StackView {
    id: stackTab2
    anchors.fill: parent
    property int modelRecordId: 0
    function returnToTab2() { stackTab2.replace("qrc:/content/Tab2.qml") }

    initialItem: ColumnLayout {
        RowLayout {
            width: parent.width
            Layout.minimumHeight: g_isAlbum ? g_maxLen / 6 : g_maxLen / 4
            anchors.fill: parent
            TextField {
                id: txt_date
                placeholderText: "dd.mm.yy"
                width: root.width / 2.2
                implicitWidth: root.width / 2.2
                horizontalAlignment: Qt.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                validator: RegExpValidator {regExp: /^[0-3][0-9]\.[0-2][0-9]\.[0-9][0-9]$/}
                font: g_fieldFont
                background: FieldBackground {}
                onAccepted: {}
            }
        }
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            model: recordsListModel

            delegate: ColumnLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                RowLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Label {
                        text: model.recordDate + ""
                        anchors.left: parent.left
                        anchors.leftMargin: g_maxLen / 10
                        font: g_fieldFont
                    }
                    Label {
                        text: model.recordSum + " $"
                        anchors.right: parent.right
                        anchors.rightMargin: g_maxLen / 10
                        font.italic: true
                        font.bold: true
                        font.family: "Courier"
                        font.pixelSize: g_maxLen / 16
                        color: "#99FF66"
                    }
                }
                Rectangle { implicitHeight: g_maxLen / 70 }
                Rectangle {
                    implicitWidth: root.width / 1.4
                    implicitHeight: 2
                    color: "#33FF99"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Rectangle { implicitHeight: g_maxLen / 40 }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modelRecordId = model.recordId
                        stackTab2.replace("qrc:/content/Tab2CurrentDate.qml")
                    }
                }
            }
        }
    }
}
