import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.1 // needed for the Window component

Window {
    id: myMessageBox
    width: Screen.width
    height: Screen.height
    visible: true
    flags: Qt.SubWindow | Qt.WindowStaysOnTopHint
    TabView {
        id: tabView
        anchors.fill: parent

        Tab { Item {}}
        Tab { Item {}}
        Tab { Item {}}
        Tab { Item {}}
        Tab { Item {}}
        style: tabViewStyle
    }
    Component {
        id: tabViewStyle
        TabViewStyle {
            tabsMovable: true

            tabBar: Rectangle {
                color: "#00E000"
                anchors.fill: parent
            }

            tab: Item {
                function loadImage(index) {
                    return "images/tab"+(index+1)+".png";
                }
                implicitWidth: Screen.width / tabView.count
                implicitHeight: Screen.width / tabView.count

                Image {
                    id: image
                    anchors.centerIn: parent
                    source: loadImage(styleData.index)
                }
//                MouseArea {
//                    onClicked: {
//                        image.anchors.bottom

//                    }
//                }
            }
        }
    }
}
