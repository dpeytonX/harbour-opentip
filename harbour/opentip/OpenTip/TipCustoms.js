/*
 A JavaScript Object holding tipping customs by country
 in alphabetical order so no one's offended :-)

 The object will have the following fields
 country: (string) localizable string identifying the country
 tip: (array) an array of tip ranges, may have up to three or be empty indicating no tip
 defaultIndex: (int) the index of the default tipping percentage based on the tip array
 description: (string) localizable string describing when tipping is acceptable and other regional quirks

 */

.pragma library

var TipCustom = function(country, tip, defaultIndex, description) {
    this.country = country
    this.tip = tip
    this.defaultIndex = defaultIndex
    this.description = description
}

var tipMap = [new TipCustom(qsTr("Default"), [15, 18, 20], 2),
              new TipCustom(qsTr("Albania"), [10], 0),
              new TipCustom(qsTr("Argentina"), [10], 0),
              new TipCustom(qsTr("Australia"), [0, 10], 0),
              new TipCustom(qsTr("Austria"), [0, 5, 10], 1),
              new TipCustom(qsTr("Belgium"), []),
              new TipCustom(qsTr("Bolivia"), [0, 5], 0),
              new TipCustom(qsTr("Bosnia"), [10, 15, 20], 0),
              new TipCustom(qsTr("Canada"), [15, 18, 20], 2),
              new TipCustom(qsTr("Chile"), [10], 0),
              new TipCustom(qsTr("China"), []),
              new TipCustom(qsTr("Colombia"), [2, 5, 10], 2),
              new TipCustom(qsTr("Croatia"), [0, 3, 5], 2),
              new TipCustom(qsTr("Czech Republic"), [0, 5, 10], 0),
              new TipCustom(qsTr("Denmark"), []),
              new TipCustom(qsTr("Dominican Republic"), [10, 15, 20], 2),
              new TipCustom(qsTr("Finland"), []),
              new TipCustom(qsTr("France"), []),
              new TipCustom(qsTr("Germany"), [0, 5, 10], 1),
              new TipCustom(qsTr("Greece"), []),
              new TipCustom(qsTr("Haiti"), [10, 15, 20], 2),
              new TipCustom(qsTr("Hungary"), []),
              new TipCustom(qsTr("Iceland"), []),
              new TipCustom(qsTr("India"), [0, 1, 5], 0),
              new TipCustom(qsTr("Ireland"), []),
              new TipCustom(qsTr("Israel"), [10, 12.5, 15], 2),
              new TipCustom(qsTr("Italy"), []),
              new TipCustom(qsTr("Japan"), []),
              new TipCustom(qsTr("Jordan"), []),
              new TipCustom(qsTr("Malaysia"), []),
              new TipCustom(qsTr("Mexico"), [10, 11.5, 15], 1),
              new TipCustom(qsTr("Netherlands"), [3, 5, 10], 0),
              new TipCustom(qsTr("New Zealand"), []),
              new TipCustom(qsTr("Norway"), [0, 3], 0),
              new TipCustom(qsTr("Paraguay"), []),
              new TipCustom(qsTr("Poland"), [5, 10, 15], 1),
              new TipCustom(qsTr("Portugal"), [1, 3], 0),
              new TipCustom(qsTr("Romania"), [10], 0),
              new TipCustom(qsTr("Russia"), [10, 15], 1),
              new TipCustom(qsTr("Singapore"), []),
              new TipCustom(qsTr("Slovakia"), [10], 0),
              new TipCustom(qsTr("South Africa"), []),
              new TipCustom(qsTr("Spain"), [0, 10, 20], 0),
              new TipCustom(qsTr("Sweden"), [0, 10, 20], 0),
              new TipCustom(qsTr("Taiwan"), []),
              new TipCustom(qsTr("Thailand"), []),
              new TipCustom(qsTr("United Kingdom"), [0, 10], 1),
              new TipCustom(qsTr("United States"), [15, 18, 20], 2)]
