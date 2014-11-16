# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-opentip

QT += qml

CONFIG += sailfishapp

SOURCES += src/harbour-opentip.cpp

OTHER_FILES += qml/* \
    qml/pages/* \
    qml/cover/* \
    rpm/* \
    translations/*.ts \
    harbour/opentip/* \
    harbour-opentip.desktop \
    images.qrc

QML_IMPORT_PATH = .
opentip.files = harbour
opentip.path = /usr/share/$${TARGET}

INSTALLS += opentip

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-opentip-ja.ts

RESOURCES += \
    images.qrc

HEADERS +=
