import QtQuick 2.0
import Sailfish.Silica 1.0

Row {
    id: tipButtons
    spacing: Theme.paddingMedium

    Button {
        text: qsTr("15%");
    }

    Button {
        text: qsTr("18%");
    }

    Button {
        text: qsTr("20%");
    }

    Button {
        text: qsTr("Other")
    }
}
