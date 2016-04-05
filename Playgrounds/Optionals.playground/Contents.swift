//: Playground - noun: a place where people can play

import UIKit

var string:String? = ""

func printHello(str:String) {
    print(str)
}

if let safeString = string {
    printHello(safeString)
}


