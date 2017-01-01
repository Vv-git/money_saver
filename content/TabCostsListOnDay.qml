import QtQml 2.2
import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

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
            spacing: g_maxLen / 30

            model: recordsListModel.get(modelRecordId).recordRecords

            delegate: ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                TextField {
                    id: txt_money
                    placeholderText: "0"
                    text: recordPrice
                    width: root.width / 2.2
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
                    implicitWidth: txt_money.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    font: g_fieldFont
                    background: FieldBackground {}
                }
                TextField {
                    id: txt_note
                    placeholderText: "note"
                    text: recordNote
                    implicitWidth: txt_money.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    font: g_fieldFont
                    background: FieldBackground {}
                    onAccepted: btn_save.forceActiveFocus()
                }
            }
        }
    }
    Component {
        id: footer
        Rectangle
        {
            height: btn_save.height + g_maxLen / 30
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                id: btn_save
                text: "Save"
                width: g_isAlbum ? root.width / 2.2 : parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                font.pixelSize: g_maxLen / 12
                onClicked: { returnToTab2() }
            }
        }
    }
}
