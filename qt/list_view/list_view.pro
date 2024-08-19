
##
## ::: List view :::
##

QMAKE_CC   = clang
QMAKE_CXX  = clang++
QMAKE_LINK = clang++

TEMPLATE = app

QT += \
  qml \
  quick

CONFIG += \
  c++20 \
  debug

SOURCES += \
  main.cpp \
  data_object.cpp

HEADERS += \
  data_object.h

RESOURCES += \
  resources.qrc

DESTDIR = _build-debug

OBJECTS_DIR = _build-debug/objects

MOC_DIR = _build-debug/moc

