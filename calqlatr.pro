TEMPLATE = app

QT += qml quick
SOURCES += main.cpp

RESOURCES += calqlatr.qrc \
    ../../shared/shared.qrc

OTHER_FILES = calqlatr.qml \
    content/Display.qml \
    content/NumberPad.qml \
    content/MyMessageBox.qml \
    content/calculator.js \
    content/images/paper-edge-left.png \
    content/images/paper-edge-right.png \
    content/images/paper-grip.png \
    content/images/login_money.png

target.path = $$[QT_INSTALL_EXAMPLES]/quick/demos/calqlatr
INSTALLS += target
