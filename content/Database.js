.pragma library
.import QtQuick.LocalStorage 2.0 as Sql

var db = Sql.LocalStorage.openDatabaseSync("Local Storage Example", "1.0", "Sample database", 100000);

function init() {
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Purchase(id INTEGER PRIMARY KEY, price INTEGER, category TEXT, note TEXT, date TEXT);')
            tx.executeSql('CREATE TABLE IF NOT EXISTS Categories(id INTEGER PRIMARY KEY, content TEXT);')
        }
    )
}

function getCategories() {
    var records = []

    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM Categories;');
            for (var i = 0; i < rs.rows.length; ++i) {
                var record = {
                    id: rs.rows.item(i).id,
                    content: rs.rows.item(i).content
                }
                records.push(record)
            }
        }
    );

    return records
}

function insertCategory(categoryName) {
    db.transaction(
        function(tx) {
            tx.executeSql('INSERT INTO Categories VALUES(NULL, ?);', [ categoryName ]);
        }
    );
}

function removeCategory(categoryName) {
    db.transaction(
        function(tx) {
            tx.executeSql('DELETE FROM Categories WHERE content=?;', [ categoryName ]);
            console.log("DELETE: " + categoryName)
        }
    );
}

function getRecords() {
    var records = []

    db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM Purchase;');
            for (var i = 0; i < rs.rows.length; ++i) {
                var record = {
                    id: rs.rows.item(i).id,
                    price: rs.rows.item(i).price,
                    category: rs.rows.item(i).category,
                    note: rs.rows.item(i).note,
                    date: rs.rows.item(i).date
                }
                records.push(record)
            }
        }
    );

    return records
}

function insertRecord(price, category, note, date) {
    db.transaction(
        function(tx) {
            tx.executeSql('INSERT INTO Purchase VALUES(NULL, ?, ?, ?, ?);', [ price, category, note, date ]);
        }
    );
}
