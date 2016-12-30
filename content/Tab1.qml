import QtQuick 2.0
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
        PieSeries { id: pieSeries }
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
        }
    }
}
