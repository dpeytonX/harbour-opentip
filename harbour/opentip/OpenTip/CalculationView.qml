import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.SailfishWidgets.Components 1.1

Item {
    property alias finalText: finalAmount.text
    property alias finalTitle: finalHeading.text
    property alias tipText: tipAmount.text
    property alias tipTitle: tipHeading.text

    Column {
        Heading {id: tipHeading}

        Label {id: tipAmount}

        Heading {id: finalHeading}

        Label {id: finalAmount}
    }
}
