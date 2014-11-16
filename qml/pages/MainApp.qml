import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.QmlLogger 2.0
import harbour.opentip.SailfishWidgets.Components 1.1
import harbour.opentip.SailfishWidgets.Settings 1.1
import harbour.opentip.OpenTip 1.0

Page {
    id: mainApp
    property alias country: settings.country
    property real percentage: tipMap[country].length ? tipMap[country].tip[tipMap[country].defaultIndex] : 0
    property real total: 0
    property variant tipMap: TipCustoms.tipMap

    signal finalAmountChanged(string amount)
    signal tipAmountChanged(string amount)
    signal updateView()

    ApplicationSettings {
        applicationName: "harbour-opentip"
        fileName: "settings"
        id:settings

        property int country: 0
    }

    SettingsPage {
        id: settingsPage
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Reset")
                onClicked: {
                    tipWidget.reset()
                    okaikei.text = ""
                }
            }
            MenuItem {
                text: qsTr("Settings")
                onClicked: {
                    pageContainer.push(settingsPage, {"settings": settings})
                }
            }
        }
        PageColumn {
            id: noTipView
            height: parent.height
            title: qsTr("Open Tip")

            Heading {text:qsTr("No tip required")}

            Paragraph {text: qsTr("The tipping custom in the country currently selected states that tipping is odd, taboo, or forbidden.")}
        }

        PageColumn {
            id: tipView
            height: parent.height
            title: qsTr("Open Tip")

            InformationalLabel {text: qsTr("Select a percentage")}

            TipButtons {
                anchors.horizontalCenter: parent.horizontalCenter
                id: tipWidget
                width: parent.width

                onReset: percentChanged(tipMap[country].defaultIndex + 1)
                onTipPercentOneChanged: if(state) percentage = radio1.value + 0.0
                onTipPercentTwoChanged: if(state) percentage = radio2.value + 0.0
                onTipPercentThreeChanged: if(state) percentage = radio3.value + 0.0
                onTipPercentFourChanged: {
                    Console.info("Show the custom percent editor")
                    if(state) percentage = customPercentage.text * 1.0
                    customPercentage.visible = state
                }
            }

            TextField {
                id: customPercentage
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                placeholderText: qsTr("Custom Percentage %")
                visible: false
                width: parent.width

                onTextChanged: percentage = text * 1.0
                validator: DoubleValidator {
                    bottom: 1
                    top: 100
                }
            }

            TextField {
                id: okaikei
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                placeholderText: qsTr("Total before tip")
                width: parent.width

                onTextChanged: total = !!text ? text : 0
                validator: DoubleValidator {
                    bottom: 0
                    decimals: 5
                    notation: DoubleValidator.StandardNotation
                }
            }

            Separator {}

            CalculationView {
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingLarge
                anchors.right: parent.right
                height: 1 // This is necessary to reserve column position
                finalTitle: qsTr("Total Amount")
                id: resultArea
                tipTitle: qsTr("Tip Amount")
                visible: false

                onTipTextChanged: tipAmountChanged(tipText)
                onFinalTextChanged: finalAmountChanged(finalText)
            }
        }
    }

    onPercentageChanged: calculate(percentage, total)

    onTotalChanged: calculate(percentage, total)

    onCountryChanged: updateView()

    onUpdateView: {
        var tipArray  = tipMap[country].tip
        Console.info("MainApp: country selected uses tip -> " + !!tipArray.length)

        if(tipArray.length) {
            noTipView.visible = false
            tipView.visible = true

            tipWidget.radio1.text = tipArray[0]
            tipWidget.radio2.text = tipArray.length >= 2 ? tipArray[1] : ""
            tipWidget.radio3.text = tipArray.length >= 3 ? tipArray[2] : ""
            tipWidget.radio4.text = qsTr("%")
            tipWidget.radio1.value = tipArray[0]
            tipWidget.radio2.value = tipArray.length >= 2 ? tipArray[1] : 0
            tipWidget.radio3.value = tipArray.length >= 3 ? tipArray[2] : 0
            tipWidget.reset()

            // If the default of two countries are the same, force signal
            var tipButton;
            switch(tipMap[country].defaultIndex) {
            case 0: tipButton = tipWidget.radio1; break;
            case 1: tipButton = tipWidget.radio2; break;
            case 2: tipButton = tipWidget.radio3; break;
            default: tipButton = tipWidget.radio4; break;
            }

            tipWidget.radioStateChanged(tipButton)
            total = !!okaikei.text ? okaikei.text : 0
        } else {
            noTipView.visible = true
            tipView.visible = false
            total = 0
        }
    }

    Component.onCompleted: updateView()

    function calculate(percentage, total) {
        Console.debug("MainApp: percentage: " + percentage)
        Console.debug("MainApp: total: " + total)

        resultArea.visible = percentage && total

        var tip = percentage / 100 * total
        var result = total + tip
        Console.debug("MainApp: tip: " + tip)
        Console.debug("MainApp: result: " + result)

        resultArea.tipText = tip
        resultArea.finalText = result
    }
}
