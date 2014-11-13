/*
 A JavaScript Object holding tipping customs by country
 in alphabetical order so no one's offended :-)

 The object will have the following fields
 country: (string) localizable string identifying the country
 tip: (array) an array of tip ranges, may have up to three or be empty indicating no tip
 defaultIndex: (int) the index of the default tipping percentage based on the tip array
 description: (string) localizable string describing when tipping is acceptable and other regional quirks

 */

var TipCustom = function(country, tip, defaultIndex, description) {
    this.country = country
    this.tip = tip
    this.defaultIndex = defaultIndex
    this.description = description
}

var tipMap = [new TipCustom(qsTr("Default"), [15, 18, 20], 2)]
