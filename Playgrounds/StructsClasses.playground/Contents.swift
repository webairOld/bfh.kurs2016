//: Playground - noun: a place where people can play

import UIKit

class MyClass {
    static let staticProperty = "Static Property"
    let storedProperty = "Stored Property"
    var mutableStoredProperty = "Mutable Stored Property"
}

MyClass.staticProperty
let classInstance = MyClass() // default constructor
classInstance.storedProperty
classInstance.mutableStoredProperty = "Veränderbar"
print("Wert ist jetzt: \(classInstance.mutableStoredProperty)")


struct MyStruct {
    let value:String
    var mutableValue:String
}

let structInstance = MyStruct(value: "value", mutableValue: "mutable value")
//structInstance.mutableValue = "Illegal, da struct nicht mutable"

var mutableStructInstance = MyStruct(value: "value", mutableValue: "mutable value")
mutableStructInstance.mutableValue = "Mit 'var' funktioniert es jetzt"
print("Wert ist jetzt : \(mutableStructInstance.mutableValue)")

// Klassen immer pass by reference, struct immer pass by value

func changeValue(var s:MyStruct) {
    s.mutableValue = "Pass by value"
}
func changeValue(c:MyClass) {
    c.mutableStoredProperty = "pass by reference"
}
changeValue(mutableStructInstance)
changeValue(classInstance)

print("\(mutableStructInstance.mutableValue)")
print("\(classInstance.mutableStoredProperty)")