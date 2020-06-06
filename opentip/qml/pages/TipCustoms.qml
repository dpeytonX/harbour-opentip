/*
 A JavaScript Object holding tipping customs by country
 in alphabetical order so no one's offended :-)

 The object will have the following fields
 country: (string) localizable string identifying the country
 tip: (array) an array of tip ranges, may have up to three or be empty indicating no tip
 defaultIndex: (int) the index of the default tipping percentage based on the tip array
 description: (string) localizable string describing when tipping is acceptable and other regional quirks

 */

import QtQuick 2.1

Item {
    function tipCustom(ctry, tp, defIndex, desc) {
        return {country: ctry, tip: tp, defaultIndex: defIndex, description: desc};
    }

    property var tipMap: [tipCustom(qsTr("Default"), [15, 18, 20], 2),
         tipCustom(qsTr("Albania"), [10], 0),
         tipCustom(qsTr("Argentina"), [10], 0),
         tipCustom(qsTr("Australia"), [0, 10], 0),
         tipCustom(qsTr("Austria"), [0, 5, 10], 1),
         tipCustom(qsTr("Belgium"), []),
         tipCustom(qsTr("Bolivia"), [0, 5], 0),
         tipCustom(qsTr("Bosnia"), [10, 15, 20], 0),
         tipCustom(qsTr("Canada"), [15, 18, 20], 2),
         tipCustom(qsTr("Chile"), [10], 0),
         tipCustom(qsTr("China"), []),
         tipCustom(qsTr("Colombia"), [2, 5, 10], 2),
         tipCustom(qsTr("Croatia"), [0, 3, 5], 2),
         tipCustom(qsTr("Czech Republic"), [0, 5, 10], 0),
         tipCustom(qsTr("Denmark"), []),
         tipCustom(qsTr("Dominican Republic"), [10, 15, 20], 2),
         tipCustom(qsTr("Finland"), []),
         tipCustom(qsTr("France"), []),
         tipCustom(qsTr("Germany"), [0, 5, 10], 1),
         tipCustom(qsTr("Greece"), []),
         tipCustom(qsTr("Haiti"), [10, 15, 20], 2),
         tipCustom(qsTr("Hungary"), []),
         tipCustom(qsTr("Iceland"), []),
         tipCustom(qsTr("India"), [0, 1, 5], 0),
         tipCustom(qsTr("Ireland"), []),
         tipCustom(qsTr("Israel"), [10, 12.5, 15], 2),
         tipCustom(qsTr("Italy"), []),
         tipCustom(qsTr("Japan"), []),
         tipCustom(qsTr("Jordan"), []),
         tipCustom(qsTr("Malaysia"), []),
         tipCustom(qsTr("Mexico"), [10, 11.5, 15], 1),
         tipCustom(qsTr("Netherlands"), [3, 5, 10], 0),
         tipCustom(qsTr(" Zealand"), []),
         tipCustom(qsTr("Norway"), [0, 3], 0),
         tipCustom(qsTr("Paraguay"), []),
         tipCustom(qsTr("Poland"), [5, 10, 15], 1),
         tipCustom(qsTr("Portugal"), [1, 3], 0),
         tipCustom(qsTr("Romania"), [10], 0),
         tipCustom(qsTr("Russia"), [10, 15], 1),
         tipCustom(qsTr("Singapore"), []),
         tipCustom(qsTr("Slovakia"), [10], 0),
         tipCustom(qsTr("South Africa"), []),
         tipCustom(qsTr("Spain"), [0, 10, 20], 0),
         tipCustom(qsTr("Sweden"), [0, 10, 20], 0),
         tipCustom(qsTr("Taiwan"), []),
         tipCustom(qsTr("Thailand"), []),
         tipCustom(qsTr("United Kingdom"), [0, 10], 1),
         tipCustom(qsTr("United States"), [15, 18, 20], 2)]
}
