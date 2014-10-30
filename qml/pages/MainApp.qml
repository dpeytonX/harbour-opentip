import QtQuick 2.0
import Sailfish.Silica 1.0
import "widgets"
import "../qmllogger/Logger.js" as Console

//TODO: display entry box for amount
//TODO: display total with tip
//TODO: reset action
Page {
    id: mainApp

    Column {
        anchors.fill: parent
        x: Theme.paddingLarge

        PageHeader {title: qsTr("Open Tip")}

        TipButtons {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
        }
    }

    Component.onCompleted: {
        Console.LOG_PRIORITY = Console.DEBUG
    }
}
