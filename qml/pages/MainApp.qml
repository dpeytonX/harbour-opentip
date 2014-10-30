import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.SailfishWidgets 1.0
import "widgets"
import "../qmllogger/Logger.js" as Console

//TODO: special number only keyboard?
//TODO: reset action
Page {
    id: mainApp
    property real percentage: tipWidget.defaultPercent
    property real total: 0

    content: Column {
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

            Heading {text: qsTr("Final Amount")}

            Label {
                id: finalAmount
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
        var result = (total + total * percentage + "");
        Console.debug("result: " + result)
        finalAmount.text = result;
    }

}
