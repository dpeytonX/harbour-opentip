import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.QmlLogger 2.0
import harbour.opentip.SailfishWidgets.Components 1.1
import harbour.opentip.OpenTip 1.0
import OpenTip 1.0

Page {
    id: mainApp
    property int country: settings.getTipCountry()
    property real percentage: tipMap[country].tip[tipMap[country].defaultIndex]
    property real total: 0
    property variant tipMap: TipCustoms.tipMap

    signal finalAmountChanged(string amount)
    signal tipAmountChanged(string amount)

    ApplicationSettings {id:settings}

    SettingsPage {id: settingsPage}

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
                    pageContainer.push(settingsPage)
                }
            }
        }

        PageColumn {
            height: parent.height
            title: qsTr("Open Tip")
            width: parent.width - Theme.paddingLarge

            InformationalLabel {
                text: qsTr("Select a percentage")
            }

            TipButtons {
                anchors.horizontalCenter: parent.horizontalCenter
                id: tipWidget
                width: parent.width

                onReset: percentChanged(tipMap[country].defaultIndex + 1)
                onTipPercentOneChanged: if(state) percentage = radio1.value + 0.0
                onTipPercentTwoChanged: if(state) percentage = radio2.value + 0.0
                onTipPercentThreeChanged: if(state) percentage = radio3.value + 0.0
                onTipPercentFourChanged: {
                    Console.log("Show the custom percent editor")
                    if(state) percentage = customPercentage.text * 1.0
                    customPercentage.visible = state
                }

                Component.onCompleted: {
                    radio1.text = tipMap[country].tip[0]
                    radio2.text = tipMap[country].tip[1]
                    radio3.text = tipMap[country].tip[2]
                    radio4.text = qsTr("%")
                    radio1.value = tipMap[country].tip[0]
                    radio2.value = tipMap[country].tip[1]
                    radio3.value = tipMap[country].tip[2]
                    reset()
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
