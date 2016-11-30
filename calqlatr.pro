TEMPLATE = app

QT += qml quick
SOURCES += main.cpp

RESOURCES += calqlatr.qrc \
    ../../shared/shared.qrc

OTHER_FILES = calqlatr.qml \
    #content/Display.qml \
    #content/NumberPad.qml \
    content/tabs.qml \
    #content/calculator.js \    

target.path = $$[QT_INSTALL_EXAMPLES]/quick/demos/calqlatr
INSTALLS += target
