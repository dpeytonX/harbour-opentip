import QtQuick 2.1
import Sailfish.Silica 1.0

Item {
    property alias finalText: finalAmount.text
    property alias finalTitle: finalHeading.text
    property alias tipText: tipAmount.text
    property alias tipTitle: tipHeading.text

    Column {
        width: parent.width
        SectionHeader {id: tipHeading}

        Label {id: tipAmount}

        SectionHeader {id: finalHeading}

        Label {id: finalAmount}
    }
}
