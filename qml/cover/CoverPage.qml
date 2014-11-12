import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.SailfishWidgets.Components 1.1
import harbour.opentip.OpenTip 1.0

StandardCover {
    property string tip
    property string total

    coverTitle: qsTr("Open Tip")
    displayDefault: !info.visible
    imageSource: "qrc:///images/desktop.png"

    Item {
        anchors.fill: parent
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingLarge

        CalculationView {
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingLarge
            finalText: total
            finalTitle: qsTr("Total")
            id: info
            tipText: tip
            tipTitle: qsTr("Tip")
            visible: !!tip && tip > 0 && !!total && total > 0
        }
    }
}
