import QtQuick 2.0
import Sailfish.Silica 1.0
import "../../qmllogger/Logger.js" as Console

Row {
    id: tipButtons
    spacing: Theme.paddingSmall

    property real defaultPercent: 0.2

    signal percentChanged(int percent)
    signal fifteenStateChanged(bool state)
    signal eighteenStateChanged(bool state)
    signal twentyStateChanged(bool state)
    signal otherStateChanged(bool state)

    TextSwitch {
        automaticCheck: false
        id: p1
        text: qsTr("15")
        width: getButtonWidth(parent.width, parent.spacing)

        onCheckedChanged: fifteenStateChanged(checked)
        onClicked: percentChanged(1)
    }

    TextSwitch {
        automaticCheck: false
        id: p2
        text: qsTr("18")
        width: getButtonWidth(parent.width, parent.spacing)

        onCheckedChanged: eighteenStateChanged(checked)
        onClicked: percentChanged(2)
    }

    TextSwitch {
        automaticCheck: false
        checked: true
        id: p3
        text: qsTr("20")
        width: getButtonWidth(parent.width, parent.spacing)

        onCheckedChanged: twentyStateChanged(checked)
        onClicked: percentChanged(3)
    }

    TextSwitch {
        automaticCheck: false
        id: p4
        text: qsTr("%")
        width: getButtonWidth(parent.width, parent.spacing)

        onCheckedChanged: otherStateChanged(checked)
        onClicked: {
            //TODO: display user entry box for percent 1-100
            percentChanged(4)
        }
    }

    onPercentChanged: {
        if(!(!!percent)) {
            Console.debug("onPercentChanged: No percent specified found")
            return;
        }

        Console.debug("onPercentChanged: got percentage " + percent)

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
