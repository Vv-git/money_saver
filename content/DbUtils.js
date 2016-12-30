.import "qrc:Database.js" as Db

function initDb() {
    Db.init()
}

function updateRecords(recordsListModel) {
    recordsListModel.clear()

    var records = Db.getRecords()
    if (records.length === 0) {
        return
    }

    var currentDate = records[0].date
    var currentRecords = []
    var currentDateSum = 0
    var currentRecordId = 0
    for (var i = 0; i < records.length; ++i) {
        if (currentDate !== records[i].date) {
            recordsListModel.append({
                "recordId": currentRecordId,
                "recordDate": currentDate,
                "recordSum": currentDateSum,
                "recordRecords": currentRecords
            })
            ++currentRecordId
            currentDate = records[i].date
            currentRecords = []
            currentDateSum = 0
        }
        currentDateSum += parseInt(records[i].price)
        currentRecords.push({
            "recordPrice": records[i].price,
            "recordCategory": records[i].category,
            "recordNote": records[i].note
        })
    }
    recordsListModel.append({
        "recordId": currentRecordId,
        "recordDate": currentDate,
        "recordSum": currentDateSum,
        "recordRecords": currentRecords
    })
}

function insertRecord(recordsListModel, price, category, note, date)
{
    Db.insertRecord(price, category, note, date)

    for (var i = 0; i < recordsListModel.count; ++i) {
        if (date === recordsListModel.get(i).recordDate) {
            recordsListModel.get(i).recordRecords.append({
                "recordPrice": parseInt(price),
                "recordCategory": category,
                "recordNote": note
            })
            recordsListModel.get(i).recordSum += parseInt(price)
            return
        }
    }

    recordsListModel.append({
        "recordId": recordsListModel.count,
        "recordDate": date,
        "recordSum": parseInt(price),
        "recordRecords": [{
            "recordPrice": parseInt(price),
            "recordCategory": category,
            "recordNote": note
        }]
    })
}

function updateCategories(categoriesListModel) {
    categoriesListModel.clear()

    var categories = Db.getCategories()

    for (var i = 0; i < categories.length; ++i) {
        categoriesListModel.append({
            "text": categories[i].content
        })
    }
}

function insertCategory(categoriesListModel, categoryName)
{
    Db.insertCategory(categoryName)

    categoriesListModel.append({
        "text": categoryName
    })
}

function removeCategory(categoriesListModel, categoryName)
{
    Db.removeCategory(categoryName)
    updateCategories(categoriesListModel)
}
