import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.QmlLogger 2.0

Row {
    spacing: Theme.paddingSmall

    property alias radio1: p1
    property alias radio2: p2
    property alias radio3: p3
    property alias radio4: p4
    property int radiosVisible: p1.visible + p2.visible + p3.visible + p4.visible

    property variant defaultIndex

    signal reset
    signal radioClicked(TextSwitch radio)
    signal radioStateChanged(TextSwitch radio)

    TextSwitch {
        automaticCheck: false
        checked: defaultIndex == this
        id: p1
        visible: !!text
        width: parent.width / radiosVisible

        property variant value

        onCheckedChanged: radioStateChanged(this)
        onClicked: radioClicked(this)
    }

    TextSwitch {
        automaticCheck: false
        checked: defaultIndex == this
        id: p2
        visible: !!text
        width: parent.width / radiosVisible

        property variant value

        onCheckedChanged: radioStateChanged(this)
        onClicked: radioClicked(this)
    }

    TextSwitch {
        automaticCheck: false
        checked: defaultIndex == this
        id: p3
        visible: !!text
        width: parent.width / radiosVisible

        property variant value

        onCheckedChanged: radioStateChanged(this)
        onClicked: radioClicked(this)
    }

    TextSwitch {
        automaticCheck: false
        checked: defaultIndex == this
        id: p4
        visible: !!text
        width: parent.width / radiosVisible

        property variant value

        onCheckedChanged: radioStateChanged(this)
        onClicked: radioClicked(this)
    }

    onRadioClicked: {
        switch(radio) {
        case p1:
            p1.checked = true
            p2.checked = false
            p3.checked = false
            p4.checked = false
            break
        case p2:
            p2.checked = true
            p1.checked = false
            p3.checked = false
            p4.checked = false
            break
        case p3:
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
}
