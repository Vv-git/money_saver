import QtQml 2.2
import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "Database.js" as Db

StackView {
    id: stackTab2
    anchors.fill: parent

    initialItem: ColumnLayout {
        id: column
        spacing: g_maxLen / 19
        Rectangle { implicitHeight: g_maxLen / 80 }
        Component {
            id: header
            ComboBox {
                id: cbx_category
                model: ["ATБ", "Сильпо", "Varus", "ЕКО маркет", "Наш край", "Fozzy"]
                implicitWidth: root.width / 2.2
                anchors.horizontalCenter: parent.horizontalCenter
                font: g_fieldFont
                background: FieldBackground {}
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

                model: ListModel {
                    ListElement {name: 0; text: "Грильяж шоколадный\nTM \"Sladko\""; price: "10"; discount: "2"}
                    ListElement {name: 1; text: "Шоколад черный\nTM \"De Luxe\""; price: "10"; discount: "2"}
                    ListElement {name: 2; text: "Цукерки галактика\nTM \"Sladko\""; price: "20"; discount: "2"}
                    ListElement {name: 3; text: "Мед акации\nTM \"Sladko\""; price: "30"; discount: "2"}
                    ListElement {name: 4; text: "Цукерки галактика\nTM \"Sladko\""; price: "40"; discount: "2"}
                    ListElement {name: 5; text: "Карамель молочний коктейль\nTM \"Sladko\""; price: "50"; discount: "2"}
                    ListElement {name: 6; text: "Цукерки галактика\nTM \"De Luxe\""; price: "60"; discount: "2"}
                    ListElement {name: 7; text: "Цукерки галактика\nTM \"Sladko\""; price: "70"; discount: "2"}
                    ListElement {name: 8; text: "Цукерки галактика\nTM \"De Luxe\""; price: "80"; discount: "2"}
                    ListElement {name: 9; text: "Цукерки галактика\nTM \"Sladko\""; price: "90"; discount: "2"}
                }

                delegate: RowLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Image {
                        id: image
                        visible: !g_isAlbum
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: g_maxLen / 10
                        fillMode: Image.Pad
                        source: "qrc:content/images/products/prod/prod" + model.name + ".jpg"
                    }
                    Label {
                        visible: g_isAlbum
                        text: model.text
                        width: root.width / 2
                        font: g_fieldFont
                        anchors.left: parent.left
                        anchors.leftMargin: g_maxLen / 10
                    }
                    Label {
                        id: txt_note
                        text: model.price + " $"
                        anchors.right: parent.right
                        anchors.rightMargin: g_maxLen / 10
                        width: g_maxLen / 10
                        font.italic: true
                        font.bold: true
                        font.family: "Courier"
                        font.pixelSize: g_maxLen / 16
                        color: "#99FF66"

                    }
            }
        }
    }
}
}
