TEMPLATE = app
QT += qml quick
SOURCES += main.cpp

RESOURCES += calqlatr.qrc

OTHER_FILES = calqlatr.qml \
    content/tabs.qml \
    content/Tab0.qml \
    content/Tab1.qml \
    content/Tab2.qml \
    content/Tab3.qml \
    content/Tab4.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols2/gallery
INSTALLS += target
