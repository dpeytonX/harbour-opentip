import QtQuick 2.1
import Sailfish.Silica 1.0
import harbour.opentip.SailfishWidgets.Components 1.3
import harbour.opentip.SailfishWidgets.Settings 1.3
import harbour.opentip.OpenTip 1.0
import harbour.opentip.QmlLogger 2.0

Page {
    id: settingsPage

    ApplicationSettings {
        applicationName: "harbour-opentip"
        fileName: "settings"
        id:settings

        property int country: 0

        onSettingsPropertyUpdated: {
            if(name == "country") {
                comboSelect.currentIndex = country;
            }
        }
    }

    PageColumn {
        title: qsTr("Settings")

        Subtext {text: qsTr("Set tipping custom")}

        ComboBox {
            id: comboSelect
            label: qsTr("Country")
            menu: ContextMenu {
                Repeater {
                    model: getModel()
                    StandardMenuItem {text: modelData}

                    Component.onCompleted: {
                        Console.info("Settings: loaded with country index " + comboSelect.currentIndex)
                        comboSelect.currentIndex = !!settings ? settings.country : comboSelect.currentIndex
                    }
                }
            }
            width: settingsPage.width //workaround for menu item display being cut

            onCurrentIndexChanged: {
                Console.info("Settings: country index set to " + currentIndex)
                settings.country = currentIndex
            }
        }
    }

    function getModel() {
        var countryModel = [];
        for(var i = 0; i < TipCustoms.tipMap.length; i++) {
            countryModel.push(TipCustoms.tipMap[i].country)
        }
        Console.debug("Settings: fetched countryModel " + countryModel)
        return countryModel
    }
}
