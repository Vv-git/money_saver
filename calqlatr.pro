TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES += calqlatr.qrc \
    ../../shared/shared.qrc

OTHER_FILES = calqlatr.qml \
    content/*.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quick/demos/calqlatr
INSTALLS += target
