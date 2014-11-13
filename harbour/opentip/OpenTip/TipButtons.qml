import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.QmlLogger 2.0

Row {
    id: tipButtons
    spacing: Theme.paddingSmall

    property alias percentTextOne: p1.text
    property alias percentTextTwo: p2.text
    property alias percentTextThree: p3.text
    property alias percentTextFour: p4.text
    property alias percentValueOne: p1.value
    property alias percentValueTwo: p2.value
    property alias percentValueThree: p3.value
    property alias percentValueFour: p4.value

    signal reset
    signal percentChanged(int percent)
    signal tipPercentOneChanged(bool state)
    signal tipPercentTwoChanged(bool state)
    signal tipPercentThreeChanged(bool state)
    signal tipPercentFourChanged(bool state)

    TipField {
        id: p1
        width: getButtonWidth(parent.width, parent.spacing)

        onCheckedChanged: tipPercentOneChanged(checked)
        onClicked: percentChanged(1)
    }

    TipField {
        id: p2
        width: getButtonWidth(parent.width, parent.spacing)

        onCheckedChanged: tipPercentTwoChanged(checked)
        onClicked: percentChanged(2)
    }

    TipField {
        id: p3
        width: getButtonWidth(parent.width, parent.spacing)

        onCheckedChanged: tipPercentThreeChanged(checked)
        onClicked: percentChanged(3)
    }

    TipField {
        id: p4
        width: getButtonWidth(parent.width, parent.spacing)

        onCheckedChanged: tipPercentFourChanged(checked)
        onClicked: percentChanged(4)
    }

    onPercentChanged: {
        Console.debug("TipButtons: percent clicked")
        if(!(!!percent)) {
            Console.debug("TipButtons: No percent specified found")
            return;
        }

        Console.debug("TipButtons: got percentage " + percent)

        switch(percent) {
        case 1:
            p1.checked = true
            p2.checked = false
            p3.checked = false
            p4.checked = false
            break
        case 2:
            p2.checked = true
            p1.checked = false
            p3.checked = false
            p4.checked = false
            break
        case 3:
            p3.checked = true
            p1.checked = false
            p2.checked = false
            p4.checked = false
            break
        default:
            p4.checked = true
            p1.checked = false
            p2.checked = false
            p3.checked = false
            break
        }
    }

    function getButtonWidth(parentWidth, parentSpacing) {
        return parent.width / 4
    }
}
