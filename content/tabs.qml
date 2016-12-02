import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.1

Page {
    id: page
    header: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        property int prevIndex: -1
        implicitHeight: Screen.width / tabBar.count
        onCurrentIndexChanged: {
            if (prevIndex === -1) {
                prevIndex = 0
                return
            }
            tabsOfTabBar.itemAt(prevIndex).setImage("")
            tabsOfTabBar.itemAt(currentIndex).setImage("clicked")
            prevIndex = currentIndex
        }
        Repeater {
            id: tabsOfTabBar
            model: 5
            TabButton {
                implicitHeight: tabBar.implicitHeight
                function setImage(suffix)
                {
                    image.source = "images/tab" + index + suffix + ".png"
                }
                Image {
                    id: image
                    anchors.fill: parent
                    source: (index == 0) ? setImage("clicked") : setImage("")
                }
                onClicked: {
                    tabBar.currentIndex = index
                }
            }
        }
    }
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        onCurrentIndexChanged: {
            if (tabBar.currentIndex !== currentIndex)
                tabBar.currentIndex = currentIndex
        }

        Item { width: swipeView.width; height: swipeView.height; Tab0 {} }
        Item { width: swipeView.width; height: swipeView.height; Tab1 {} }
        Item { width: swipeView.width; height: swipeView.height; Tab2 {} }
        Item { width: swipeView.width; height: swipeView.height; Tab3 {} }
        Item { width: swipeView.width; height: swipeView.height; Tab4 {} }
    }
}
