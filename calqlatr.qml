import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0
import "qrc:content"
import "qrc:content/DbUtils.js" as DbUtils

StackView {
    id: root
    width: Screen.width
    height: Screen.height
    property int g_maxLen: Screen.width < Screen.height ? Screen.width : Screen.height
    property bool g_isAlbum: Screen.width > Screen.height ? true : false
    property font g_fieldFont: Qt.font({family: "Times New Roman", pixelSize: g_maxLen / 16})
    Settings {
        id: settings
        property int money: 730
    }
    ListModel {
        id: categoriesListModel
    }
    ListModel {
        id: recordsListModel
    }
    Component.onCompleted: {
        DbUtils.initDb()
        DbUtils.updateCategories(categoriesListModel)
        DbUtils.updateRecords(recordsListModel)
    }

    initialItem: Qt.resolvedUrl("content/LoginPage.qml")
}
