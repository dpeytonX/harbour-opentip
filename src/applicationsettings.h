#ifndef APPLICATIONSETTINGS_H
#define APPLICATIONSETTINGS_H

#include <QObject>
#include <QSettings>

class ApplicationSettings : public QObject
{
    Q_OBJECT
public:
    ApplicationSettings(QObject* parent=0);
    Q_INVOKABLE int getTipCountry() {
        return settings.value("country", 0).toInt();
    }

    Q_INVOKABLE void setTipCountry(int id) {
        settings.setValue("country", id);
    }

private:
    QSettings settings;
};

#endif // APPLICATIONSETTINGS_H
