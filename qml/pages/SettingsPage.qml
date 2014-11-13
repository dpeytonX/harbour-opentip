import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.SailfishWidgets.Components 1.1
import harbour.opentip.OpenTip 1.0
import harbour.opentip.QmlLogger 2.0
import OpenTip 1.0

Page {
    id: settingsPage

    signal countryChanged

    ApplicationSettings {id:settings}

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
                        comboSelect.currentIndex = settings.getTipCountry()
                    }
                }
            }
            width: settingsPage.width //workaround for menu item display being cut

            onCurrentIndexChanged: {
                Console.info("Settings: country index set to " + currentIndex)
                settings.setTipCountry(currentIndex)
                countryChanged()
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
