/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0
import "content/Database.js" as Db
import "content"

StackView {
    id: root
    width: Screen.width
    height: Screen.height
    property int g_maxLen: Screen.width < Screen.height ? Screen.width : Screen.height
    property bool g_isAlbum: Screen.width > Screen.height ? true : false
    property font g_fieldFont: Qt.font({
        family: "Times New Roman",
        pixelSize: g_maxLen / 16
    })
    Item { //Settings
        id: settings
        property int money: 730
    }
    ListModel {
        id: categoriesListModel
        Component.onCompleted: {
            Db.init()
            updateCategories()
        }
    }
    ListModel {
        id: recordsListModel
        Component.onCompleted: {
            Db.init()
            updateRecords()
        }
    }
    function updateRecords() {
        recordsListModel.clear()

        var records = Db.getRecords()

        for (var i = 0; i < records.length; i++) {
            recordsListModel.append({
                "recordId": records[i].id,
                "recordPrice": records[i].price,
                "recordCategory": records[i].category,
                "recordNote": records[i].note,
                "recordDate": records[i].date
            })
        }
    }
    function updateCategories() {
        categoriesListModel.clear()

        var records = Db.getCategories()

        for (var i = 0; i < records.length; i++) {
            categoriesListModel.append({
                "text": records[i].content
            })
        }
    }

    initialItem: Qt.resolvedUrl("content/tabs.qml")
//    initialItem: Rectangle {
//        color: "#00E000"

//        Image {
//            source: "content/images/login_money.png"
//            anchors.horizontalCenter: parent.horizontalCenter
//            y: root.height / 2 - height
//        }

//        Grid {
//            id: buttons
//            columns: 1
//            rowSpacing: maxLen / 36
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: maxLen / 10
//            anchors.horizontalCenter: parent.horizontalCenter

//            TextField {
//                id: textField
//                placeholderText: "login name"
//                width: maxLen * 0.7
//                font.pixelSize: maxLen / 16
//                background: Rectangle {
//                    radius: 10
//                    border.color: "#FFFFFF"
//                    border.width: 2
//                }
//            }
//            TextField {
//                placeholderText: "password"
//                width: textField.width
//                font: textField.font
//                background: Rectangle {
//                    radius: 10
//                    border.color: "#FFFFFF"
//                    border.width: 2
//                }
//            }
//            Button {
//                text: "Login"
//                width: textField.width
//                height: textField.height
//                font: textField.font
//                onClicked: {
//                    root.replace("qrc:/content/tabs.qml")
//                }
//                background: Rectangle {
//                    radius: 10
//                    color: "#00CC00"
//                    border.color: "#FFFFFF"
//                    border.width: 2
//                }
//            }
//        }
//    }
}
