#include "applicationsettings.h"

ApplicationSettings::ApplicationSettings(QObject *parent) : QObject(parent),
    settings("harbour-opentip", "settings")
{
}
