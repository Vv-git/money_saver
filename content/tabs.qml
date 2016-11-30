import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.1

Page {
    id: page
    header: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        implicitHeight: Screen.width / tabBar.count
        onCurrentIndexChanged: {
            console.log("TabBar currentIndex: " + currentIndex)
            updateTabBar(currentIndex)
        }
        function updateTabBar(currentIndex)
        {
            for (var i = 0; i < tabsOfTabBar.count; ++i)
                tabsOfTabBar.itemAt(i).refreshImage()
            tabsOfTabBar.itemAt(currentIndex).setClickedTabImage()
        }
        Repeater {
            id: tabsOfTabBar
            model: 5
            TabButton {
                implicitHeight: Screen.width / tabBar.count
                function refreshImage()
                {
                    image.source = "images/tab"+(index+1)+".png"
                }
                function setClickedTabImage()
                {
                    image.source = "images/tab"+(index+1)+"clicked.png"
                }
                Image {
                    id: image
                    anchors.fill: parent
                    source: "images/tab"+(index+1)+".png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            tabBar.currentIndex = index
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
        onCurrentIndexChanged: {
            console.log("SwipeView currentIndex: " + currentIndex)
            if (tabBar.currentIndex !== currentIndex)
                tabBar.currentIndex = currentIndex
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
