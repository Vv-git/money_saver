import QtQml 2.2
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "Database.js" as Db

Item {
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: spacing

        RowLayout {
            TextField {
                id: txt_money
                placeholderText: "date"
                width: root.width / 2
                horizontalAlignment: Qt.AlignHCenter
                implicitWidth: root.width / 2
                validator: IntValidator {bottom: 0}
                anchors.horizontalCenter: parent.horizontalCenter
                font: g_fieldFont
                background: FieldBackground {}
                onAccepted: cbx_category.forceActiveFocus()
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            model: recordsListModel

            delegate: RowLayout {
                anchors.left: parent.left
                anchors.right: parent.right

                Label {
                    Layout.fillWidth: true
                    text: recordId + " " + recordPrice + " " + model.recordCategory + " " + recordNote + " " + recordDate
                }

                Button {
                    text: "x"
                    onClicked: {
                        Db.removeRecord(model.recordId)
                        updateRecords()
                    }
                }
            }
        }
    }
}
