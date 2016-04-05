//: Playground - noun: a place where people can play

import UIKit

struct MyStruct {
    var mutableString = "Hallo"
    
    func halloWelt(param1:String, param2:String="hallo") -> (wert:Int, wert2:Int) {
        print(param1)
        print(param2)
        return (3,4)
    }
}

class MyParentClass{}

class MyParentClass2{}

protocol MyProtocol{}
protocol MyProtocol2{}

class MyClass: MyParentClass, MyProtocol, MyProtocol2 {
    static var staticString = "Static String"
    let string:String = "Hallo Welt"
    var mutableString = "Hallo Welt"
    
    func halloWelt(param1:String, param2:String="hallo") -> (wert:Int, wert2:Int) {
        print(param1)
        print(param2)
        return (3,4)
    }
}

let instance = MyClass()
let tuple = instance.halloWelt("")

func changeValue(inst:MyClass) {
    inst.mutableString = "Neuer Wert"
}

func changeValue(var inst:MyStruct) {
    inst.mutableString = "Neuer Wert"
}

changeValue(instance)
print(instance.mutableString)

var structInstance = MyStruct()
changeValue(structInstance)
structInstance.mutableString

