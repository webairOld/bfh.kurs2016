//: Playground - noun: a place where people can play

import UIKit

let string = "Hallo"
let int = 2
let double = 3.1

var arrayOfStrings = ["Hallo"]
var setOfStrings:Set<String> = ["Hallo", "Welt"]
var dictionary = ["Key":3]

// loops
for string in arrayOfStrings {
    print(string)
}
let tuple = ("Hallo", 3)
tuple.0
tuple.1

for (i, string) in arrayOfStrings.enumerate() {
    print(string)
    print("index: \(i)")
}

for (key, value) in dictionary {
    print(key)
    print("value: \(value)")
}


