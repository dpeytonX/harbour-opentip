import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.QmlLogger 2.0

RadioGroup {
    radioMargin: Theme.paddingSmall

    property string percentTextOne: radio1.text
    property string percentTextTwo: radio2.text
    property string percentTextThree: radio3.text
    property string percentTextFour: radio4.text
    property variant percentValueOne: radio1.value
    property variant percentValueTwo: radio2.value
    property variant percentValueThree: radio3.value
    property variant percentValueFour: radio4.value

    signal percentChanged(int percent)
    signal tipPercentOneChanged(bool state)
    signal tipPercentTwoChanged(bool state)
    signal tipPercentThreeChanged(bool state)
    signal tipPercentFourChanged(bool state)

    onRadioStateChanged: {
        switch(radio) {
        case radio1:
            return tipPercentOneChanged(radio.checked)
        case radio2:
            return tipPercentTwoChanged(radio.checked)
        case radio3:
            return tipPercentThreeChanged(radio.checked)
        default:
            return tipPercentFourChanged(radio.checked)
        }
    }

    onPercentChanged: {
        switch(percent) {
        case 1:
            return radioClicked(radio1)
        case 2:
            return radioClicked(radio2)
        case 3:
            return radioClicked(radio3)
        default:
            return radioClicked(radio4)
        }
    }
}
