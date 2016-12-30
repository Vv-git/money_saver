import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.1

Page {
    header: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        property int prevIndex: -1
        implicitHeight: g_isAlbum ? g_maxLen/(1.9*tabBar.count) : g_maxLen / tabBar.count
        onCurrentIndexChanged: {
            if (prevIndex === -1) {
                prevIndex = 0
                return
            }
            tabsOfTabBar.itemAt(prevIndex).setClicked(false)
            tabsOfTabBar.itemAt(currentIndex).setClicked(true)
            prevIndex = currentIndex
        }
        Repeater {
            id: tabsOfTabBar
            model: 5
            TabButton {
                implicitHeight: tabBar.implicitHeight
                background: Rectangle {id: tabButtonBg; color: "#33FF00"}
                function setClicked(isClicked)
                {
                    image.source = "qrc:content/images/tab" + index + (isClicked ? "clicked" : "") + ".png"
                    tabButtonBg.color = isClicked ? "#FFFFFF" : "#33FF00"
                }
                Image {
                    id: image
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: g_isAlbum ? Image.Pad : undefined
                    source: (index == 0) ? setClicked(true) : setClicked(false)
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
            if (tabBar.currentIndex !== currentIndex) {
                tabBar.currentIndex = currentIndex
            }
        }

        Item { width: swipeView.width; height: swipeView.height; Tab0 {} }
        Item { width: swipeView.width; height: swipeView.height; Tab1 {} }
        Item { width: swipeView.width; height: swipeView.height; Tab2 {} }
        Item { width: swipeView.width; height: swipeView.height; Tab3 {} }
        Item { width: swipeView.width; height: swipeView.height; Tab4 {} }
    }
}
