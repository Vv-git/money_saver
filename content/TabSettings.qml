import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "qrc:DbUtils.js" as DbUtils

Item {
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: g_maxLen / 20

        Label {
            text: "Money: " + settings.money + " $"
            font: g_fieldFont
        }
        RowLayout {
            TextField {
                id: txt_money
                Layout.fillWidth: true
                inputMethodHints: Qt.ImhNoPredictiveText
            }
            Button {
                text: "Save"
                enabled: txt_money.length > 0
                onClicked: {
                    settings.money = parseInt(txt_money.text)
                }
            }
        }

        Label {
            text: "Categories:"
            font: g_fieldFont
        }
        RowLayout {
            TextField {
                id: txt_category
                Layout.fillWidth: true
                inputMethodHints: Qt.ImhNoPredictiveText
            }
            Button {
                text: "Add"
                enabled: txt_category.length > 0
                onClicked: {
                    DbUtils.insertCategory(categoriesListModel, txt_category.text)
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
                    text: model.text
                }
                Button {
                    text: "x"
                    onClicked: {
                        DbUtils.removeCategory(categoriesListModel, model.text)
                    }
                }
            }
        }
    }
}
