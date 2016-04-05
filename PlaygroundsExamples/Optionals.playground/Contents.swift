//: Playground - noun: a place where people can play

import UIKit


var string = "Not Optional"
var optinalString:String? = "Optional"
var optinalStringWithoutValue:String? = nil


print(string)
print(optinalString)
print(optinalStringWithoutValue)

// check if value exists
if let safeString = optinalString {
    print(safeString)
}
if let safeString = optinalStringWithoutValue {
    print(safeString)
}



