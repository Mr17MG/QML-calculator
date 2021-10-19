QT += qml scxml

CONFIG += c++11

SOURCES += \
    main.cpp

RESOURCES += calculator.qrc

STATECHARTS = statemachine.scxml

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
