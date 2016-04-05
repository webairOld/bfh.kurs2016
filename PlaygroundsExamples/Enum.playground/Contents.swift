//: Playground - noun: a place where people can play

import Foundation

enum MyEnum {
    case First
    case Second
    case WithParameter(Int)
}


let enumValue = MyEnum.First

switch (enumValue) {
    case .First:
        print("first")
    case .Second:
        print("second")
    default:
        print("nothing")
}

let enumValueWithParam = MyEnum.WithParameter(3)

switch (enumValueWithParam) {
    case .WithParameter(let number):
        print("enum value: \(number)")
    default:
        print("nothing")
}

// where statement
switch (enumValueWithParam) {
case .WithParameter(let number) where number == 2:
    print("enum value: \(number)")
case .WithParameter(let number) where number == 3:
    print("found: \(number)")
default:
    print("nothing")
}