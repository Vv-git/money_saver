import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import "Database.js" as Db

Item {
    anchors.fill: parent
    ColumnLayout {
        spacing: g_maxLen / 19
        width: parent.width
        RowLayout {
            width: parent.width
            Layout.minimumHeight: g_isAlbum ? g_maxLen / 8 : g_maxLen / 4
            Label {
                id: lbl_money
                anchors.top: parent.top
                anchors.topMargin: g_maxLen / 20
                anchors.left: parent.left
                anchors.leftMargin: g_maxLen / 12
                wrapMode: Label.Wrap
                text: settings.money + " $"
                font.italic: true
                font.bold: true
                font.family: "Courier"
                font.pixelSize: g_maxLen / 12
                color: "#33FF99"
                SequentialAnimation on scale {
                    id: scaleAnim
                    running: false
                    NumberAnimation { from: 1; to: 1.8; easing.type: Easing.SineCurve }
                }
            }
        }
        TextField {
            id: txt_money
            placeholderText: "0"
            width: root.width / 2
            horizontalAlignment: Qt.AlignHCenter
            implicitWidth: root.width / 2
            validator: IntValidator {bottom: 0}
            anchors.horizontalCenter: parent.horizontalCenter
            font: g_fieldFont
            background: FieldBackground {}
            onAccepted: cbx_category.forceActiveFocus()
        }        
        Rectangle {
            visible: txt_money.text === "" ? false : true
            implicitWidth: root.width / 1.5
            implicitHeight: 2
            color: "#CCCCCC"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        ComboBox {
            id: cbx_category
            visible: txt_money.text === "" ? false : true
            model: categoriesListModel
            implicitWidth: root.width / 2.2
            anchors.horizontalCenter: parent.horizontalCenter
            font: g_fieldFont
            background: FieldBackground {}
        }
        TextField {
            id: txt_note
            visible: txt_money.text === "" ? false : true
            placeholderText: "note"
            implicitWidth: root.width / 2.2
            anchors.horizontalCenter: parent.horizontalCenter
            font: g_fieldFont
            background: FieldBackground {}
            onAccepted: btn_save.forceActiveFocus()
        }
    }
    Button {
        id: btn_save
        visible: txt_money.text === "" ? false : true
        text: "Save"
        anchors.bottom: parent.bottom
        width: g_isAlbum ? root.width / 2.2 : parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: g_maxLen / 12
        onClicked: {
            scaleAnim.running = true
            settings.money -= parseInt(txt_money.text)
            Db.insertRecord(txt_money.text, cbx_category.currentText, txt_note.text, Qt.formatDate(new Date(), "dd.MM.yy"))
            updateRecords()
            txt_money.text = ""
        }
    }
}
