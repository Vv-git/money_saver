import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "Database.js" as Db

Item {
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: spacing

        Label {
            text: "Categories:"
            font: g_fieldFont
        }

        RowLayout {
            TextField {
                id: textField
                Layout.fillWidth: true
                inputMethodHints: Qt.ImhNoPredictiveText
            }

            Button {
                text: "Insert"
                enabled: textField.length > 0

                onClicked: {
                    Db.insertCategory(textField.text)
                    updateCategories()
                }
            }
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            model: categoriesListModel

            delegate: RowLayout {
                anchors.left: parent.left
                anchors.right: parent.right

                Label {
                    Layout.fillWidth: true
                    text: model.text + ""
                }

                Button {
                    text: "x"
                    onClicked: {
                        Db.removeCategory(model.text)
                        updateCategories()
                    }
                }
            }
        }
    }
}
