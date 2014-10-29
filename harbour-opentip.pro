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

CONFIG += sailfishapp

SOURCES += src/harbour-opentip.cpp

OTHER_FILES += qml/harbour-opentip.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-opentip.changes.in \
    rpm/harbour-opentip.spec \
    rpm/harbour-opentip.yaml \
    translations/*.ts \
    harbour-opentip.desktop

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-opentip-de.ts

