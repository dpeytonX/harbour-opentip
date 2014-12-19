import QtQuick 2.1
import Sailfish.Silica 1.0
import harbour.opentip.QmlLogger 2.0
import harbour.opentip.SailfishWidgets.JS 1.3
import "pages"
import "cover"

ApplicationWindow
{
    initialPage: Component {
        id: mainApp
        MainApp {
            onFinalAmountChanged: coverPage.total = amount
            onTipAmountChanged: coverPage.tip = amount

            Component.onCompleted: {
                Console.info("harbour-opentip: setting actions")
                resetAction.triggered.connect(reset)
            }
        }
    }
    cover: CoverPage {
        id: coverPage

        CoverActionList {
            enabled: coverPage.total != 0 || coverPage.tip != 0

            CoverAction {
                id: resetAction
                iconSource: IconThemes.iconCoverRefresh
                onTriggered: Console.info("CoverAction: tip reset")
            }
        }

        onTotalChanged: Console.debug("CoverPage: total changed " + total)

        onTipChanged: Console.debug("CoverPage: tip changed " + tip)
    }

    Component.onCompleted: Console.LOG_PRIORITY = Console.INFO
}


