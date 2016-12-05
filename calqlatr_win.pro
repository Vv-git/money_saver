TEMPLATE = app
QT += qml quick
SOURCES += main.cpp

RESOURCES += calqlatr.qrc

OTHER_FILES = calqlatr.qml \
    content/Database.js \
    content/*.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols2/gallery
INSTALLS += target
