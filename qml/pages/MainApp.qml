import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.SailfishWidgets 1.0
import "widgets"
import "../qmllogger/Logger.js" as Console

Page {
    id: mainApp
    property real percentage: tipWidget.defaultPercent
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

        Column {
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingLarge
            anchors.right: parent.right

            PageHeader {title: qsTr("Open Tip")}

            InformationalLabel {
                text: qsTr("Select a percentage")
            }

            TipButtons {
                anchors.horizontalCenter: parent.horizontalCenter
                id: tipWidget
                width: parent.width

                onFifteenStateChanged: if(state) percentage = 0.15
                onEighteenStateChanged: if(state) percentage = 0.18
                onTwentyStateChanged: if(state) percentage = 0.2
                onOtherStateChanged: {
                    Console.log("Show the custom percent editor")
                    customPercentage.visible = state
                }
            }

            TextField {
                id: customPercentage
                inputMethodHints: Qt.ImhDigitsOnly
                placeholderText: qsTr("Custom Percentage %")
                visible: false
                width: parent.width

                onTextChanged: percentage = text / 100
                validator: IntValidator {
                    bottom: 0
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

            Column {
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingLarge
                anchors.right: parent.right
                id: resultArea
                visible: false

                Heading {text: qsTr("Tip Amount")}

                Label {
                    id: tipAmount
                    onTextChanged: tipAmountChanged(text)
                }

                Heading {text: qsTr("Total Amount")}

                Label {
                    id: finalAmount
                    onTextChanged: finalAmountChanged(text)
                }
            }
        }
    }

    onPercentageChanged: calculate(percentage, total)

    onTotalChanged: calculate(percentage, total)

    Component.onCompleted: {
        Console.LOG_PRIORITY = Console.DEBUG
    }

    function calculate(percentage, total) {
        Console.info("onTotalChanged()")
        Console.debug("percentage: " + percentage)
        Console.debug("total: " + total)
        if(!percentage || !total)
        {
            resultArea.visible = false
            return
        }
        resultArea.visible = true

        //TODO: consider formatting decimal places
        var tip = total * percentage
        var result = total + tip
        Console.debug("tip: " + tip)
        Console.debug("result: " + result)

        tipAmount.text = tip
        finalAmount.text = result
    }

}
