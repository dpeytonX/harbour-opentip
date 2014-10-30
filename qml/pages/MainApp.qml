import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.SailfishWidgets 1.0 as SailfishWidgets
import "widgets"

Page {
    id: mainApp

    Column {
        anchors.fill: parent
        x: Theme.paddingLarge

        PageHeader {title: qsTr("Open Tip")}

        TipButtons {width: parent.width}
    }
}
