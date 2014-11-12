import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.opentip.SailfishWidgets.Components 1.1
import harbour.opentip.OpenTip 1.0

CoverBackground {
    property string tip
    property string total

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

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 0.6
            source: "qrc:///images/desktop.png"
            visible: !info.visible
        }
    }


    InformationalLabel {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Open Tip")
        visible: !info.visible
    }
}
