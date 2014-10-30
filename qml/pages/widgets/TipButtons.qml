import QtQuick 2.0
import Sailfish.Silica 1.0
import "../../qmllogger/Logger.js" as Console

Row {
    id: tipButtons
    spacing: Theme.paddingSmall

    signal percentChanged(int percent)

    TextSwitch {
        id: p1
        text: qsTr("15")
        width: getButtonWidth(parent.width, parent.spacing)

        onClicked: percentChanged(1)
    }

    TextSwitch {
        id: p2
        text: qsTr("18")
        width: getButtonWidth(parent.width, parent.spacing)

        onClicked: percentChanged(2)
    }

    TextSwitch {
        checked: true
        id: p3
        text: qsTr("20")
        width: getButtonWidth(parent.width, parent.spacing)

        onClicked: percentChanged(3)
    }

    TextSwitch {
        id: p4
        text: qsTr("%")
        width: getButtonWidth(parent.width, parent.spacing)

        onClicked: {
            //TODO: display user entry box for percent 1-100
            percentChanged(4)
        }
    }

    function getButtonWidth(parentWidth, parentSpacing) {
        return parent.width / 4
    }

    onPercentChanged: {
        if(!(!!percent)) {
            Console.debug("onPercentChanged: No percent specified found")
            return;
        }

        Console.debug("onPercentChanged: got percentage " + percent)

        switch(percent) {
        case 1:
            if(!p1.checked) p1.checked = true
            p2.checked = false
            p3.checked = false
            p4.checked = false
            break
        case 2:
            if(!p1.checked) p1.checked = true
            p1.checked = false
            p3.checked = false
            p4.checked = false
            break
        case 3:
            if(!p1.checked) p1.checked = true
            p1.checked = false
            p2.checked = false
            p4.checked = false
            break
        default:
            if(!p1.checked) p1.checked = true
            p1.checked = false
            p2.checked = false
            p3.checked = false
            break
        }
    }
}
