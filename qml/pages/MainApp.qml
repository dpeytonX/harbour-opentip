import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.QmlLogger 2.0
import harbour.opentip.SailfishWidgets.Components 1.1
import harbour.opentip.OpenTip 1.0

Page {
    id: mainApp
    property real percentage: TipCustoms.tipMap[0].tip[TipCustoms.tipMap[0].defaultIndex]
    property real total: 0

    signal finalAmountChanged(string amount)
    signal tipAmountChanged(string amount)

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
                percentTextOne: TipCustoms.tipMap[0].tip[0]
                percentTextTwo: TipCustoms.tipMap[0].tip[1]
                percentTextThree: TipCustoms.tipMap[0].tip[2]
                percentTextFour: qsTr("%")
                percentValueOne: TipCustoms.tipMap[0].tip[0]
                percentValueTwo: TipCustoms.tipMap[0].tip[1]
                percentValueThree: TipCustoms.tipMap[0].tip[2]
                width: parent.width

                onReset: percentChanged(
                             TipCustoms.tipMap[0].tip[TipCustoms.tipMap[0].defaultIndex])
                onTipPercentOneChanged: if(state) percentage = percentValueOne
                onTipPercentTwoChanged: if(state) percentage = percentValueTwo
                onTipPercentThreeChanged: if(state) percentage = percentValueThree
                onTipPercentFourChanged: {
                    Console.log("Show the custom percent editor")
                    customPercentage.visible = state
                }
            }

            TextField {
                id: customPercentage
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                placeholderText: qsTr("Custom Percentage %")
                visible: false
                width: parent.width

                onTextChanged: percentage = text / 100
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
