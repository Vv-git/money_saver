import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtCharts 2.0
import "qrc:Database.js" as Db

Item {
    anchors.fill: parent

    ChartView {
        id: chart
        anchors.fill: parent
        antialiasing: true
        animationOptions: ChartView.SeriesAnimations
        legend.visible: false
        PieSeries {
            id: pieSeries
            property string lastClickedSliceLabel
            property PieSlice lastClickedSlice
            onClicked: {
                if (lastClickedSlice && lastClickedSlice !== slice)
                {
                    lastClickedSlice.exploded = false
                    lastClickedSlice.label = lastClickedSliceLabel
                }

                slice.exploded = !slice.exploded

                lastClickedSliceLabel = slice.exploded ? slice.label : lastClickedSliceLabel
                slice.label = slice.exploded ? slice.value + " $" : lastClickedSliceLabel
                lastClickedSlice = slice
            }
        }
    }

    Component.onCompleted: {
        var records = Db.getRecords()
        var categories = Db.getCategories()

        if (records.length === 0 || categories === 0) {
            return
        }

        for (var i = 0; i < categories.length; ++i) {
            var sum = 0
            for (var j = 0; j < records.length; j++) {
                if (categories[i].content === records[j].category) {
                    sum += records[j].price
                }
            }
            pieSeries.append(categories[i].content, sum);

            pieSeries.at(i).labelVisible = true
            pieSeries.at(i).labelPosition = PieSlice.LabelOutside
            pieSeries.at(i).labelColor = "#00CC00"
            pieSeries.at(i).labelFont = g_fieldFont
        }
    }
}
