//: Playground - noun: a place where people can play

import UIKit

/* Basics */

let constant:String = "Kann nicht verändert werden"
//constant = "Ne, illegal"

var variable:String = "Kann verändert werden"
variable = "Jup, funktioniert"

let autoTypisierung = "Typ is optional und muss nicht explizit angegeben werden"

/* printing objects */

print("Irgend ein Object: \(constant)")


/* Collections */

let immutableArray:[String] = ["Nicht", "veränderbare","Liste", "vom", "typ", "String"]
//immutableArray.append("Ne, illegal")

var mutableArray = ["Veränderbare", "Liste", "vom", "typ", "String"]
mutableArray.append("Jup, funktioniert")

/* subscript */
immutableArray[0]
mutableArray[0] = "Wirklich veränderbare"
print("\(mutableArray)")

let immutableDictionary:[String:Int] = ["Zahl 3": 3, "Zahl 4": 4]
// immutableDictionary["Zahl 5"] = 5
print("\(immutableDictionary["Zahl 3"])")

var mutableDictionary:[String:Int] = ["Zahl 3": 3, "Zahl 4": 4]
mutableDictionary["Zahl 5"] =  5
print("\(mutableDictionary)")

/* loops */

let array = ["Eintrag"]
for entry in array {
    print("entry: \(entry)")
}
for (i,entry) in array.enumerate() {
    print("index: \(i), entry: \(entry)")
}

let dictionary = ["key": "value"]
for tuple in dictionary {
    print("key: \(tuple.0)")
    print("value: \(tuple.1)")
}
for (key,value) in dictionary {
    print("index: \(key), entry: \(value)")
}
