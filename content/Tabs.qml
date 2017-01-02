import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Window 2.1

Page {
    header: TabBar {
        id: tabBar
        currentIndex: tabsView.currentIndex
        property int prevIndex: -1
        implicitHeight: g_maxLen / (tabBar.count * (g_isAlbum ? 1.9 : 1))
        onCurrentIndexChanged: {
            if (prevIndex === -1) {
                prevIndex = 0
                return
            }
            tabsButtons.itemAt(prevIndex).setClicked(false)
            tabsButtons.itemAt(currentIndex).setClicked(true)
            prevIndex = currentIndex
        }
        Repeater {
            id: tabsButtons
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
        id: tabsView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        onCurrentIndexChanged: {
            if (tabBar.currentIndex !== currentIndex) {
                tabBar.currentIndex = currentIndex
            }
        }

        Item { width: tabsView.width; height: tabsView.height; TabAddCost {} }
        Item { width: tabsView.width; height: tabsView.height; TabChart {} }
        Item { width: tabsView.width; height: tabsView.height; TabCostsList {} }
        Item { width: tabsView.width; height: tabsView.height; TabProducts {} }
        Item { width: tabsView.width; height: tabsView.height; TabSettings {} }
    }
}
