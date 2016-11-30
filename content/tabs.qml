import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.1

Page {
    id: page
    header: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        implicitHeight: Screen.width / tabBar.count
        Repeater {
            id: tabsOfTabBar
            model: 5
            TabButton {
                implicitHeight: Screen.width / tabBar.count
                function refreshImage()
                {
                    image.source = "images/tab"+(index+1)+".png"
                }
                Image {
                    id: image
                    anchors.fill: parent
                    source: "images/tab"+(index+1)+".png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            for (var i = 0; i < tabsOfTabBar.count; ++i)
                                tabsOfTabBar.itemAt(i).refreshImage()
                            image.source = "images/tab"+(index+1)+"clicked.png"
                        }
                    }
                }
            }
        }
    }
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Item {
            width: swipeView.width
            height: swipeView.height

            Column {
                spacing: 40
                width: parent.width

                Label {
                    width: parent.width
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "1"
                }
            }
        }
        Item {
            width: swipeView.width
            height: swipeView.height

            Column {
                spacing: 40
                width: parent.width

                Label {
                    width: parent.width
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "2"
                }
            }
        }
        Item {
            width: swipeView.width
            height: swipeView.height

            Column {
                spacing: 40
                width: parent.width

                Label {
                    width: parent.width
                    wrapMode: Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "3"
                }
            }
        }
    }
}
