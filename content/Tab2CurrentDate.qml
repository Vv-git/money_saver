import QtQml 2.2
import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "Database.js" as Db


ColumnLayout {
    id: column
    Component {
        id: header
        Label {
            text: recordsListModel.get(modelRecordId).recordDate
            height: g_maxLen / 6
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Qt.AlignVCenter
            font.family: "Courier"
            font.bold: true
            font.pixelSize: g_maxLen / 12
        }
    }
    Flickable {
        Layout.fillHeight: true
        Layout.fillWidth: true
        ListView {
            id: list
            width: parent.width
            height: parent.height
            header: header
            footer: footer
            anchors.horizontalCenter: parent.horizontalCenter

            model: recordsListModel.get(modelRecordId).recordRecords

            delegate: ColumnLayout {
                anchors.left: parent.left
                anchors.right: parent.right
                TextField {
                    id: txt_money
                    placeholderText: "0"
                    text: recordPrice
                    width: root.width / 2
                    horizontalAlignment: Qt.AlignHCenter
                    implicitWidth: root.width / 2
                    validator: IntValidator {bottom: 0}
                    anchors.horizontalCenter: parent.horizontalCenter
                    font: g_fieldFont
                    background: FieldBackground {}
                    onAccepted: txt_note.forceActiveFocus()
                }
                TextField {
                    readOnly: true
                    text: recordCategory
                    implicitWidth: root.width / 2.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font: g_fieldFont
                    background: FieldBackground {}
                }
                TextField {
                    id: txt_note
                    placeholderText: "note"
                    text: recordNote
                    implicitWidth: root.width / 2.2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font: g_fieldFont
                    background: FieldBackground {}
                    onAccepted: btn_save.forceActiveFocus()
                }
                Rectangle { implicitHeight: g_maxLen / 30 }
            }
        }
    }
    Component {
        id: footer
        Button {
            id: btn_save
            text: "Save"
            width: g_isAlbum ? root.width / 2.2 : parent.width
            implicitWidth: g_isAlbum ? root.width / 2.2 : parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: g_maxLen / 12
            onClicked: { returnToTab2() }
        }
    }
}
