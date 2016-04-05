//: Playground - noun: a place where people can play

import UIKit

// basic function
func function() -> Void {
    print("function")
    return
}

let assignFunction = function
assignFunction()

let closure = {
    print("closure")
    return
}
closure()


// params
func functionWithParams(name:String) {
    print(name)
}
functionWithParams("Param")

let closureWithParams = {(name:String) in
    print(name)
    return
}
closureWithParams("Param")

// return value
func functionWithReturnValue() -> Int {
    return 3
}
functionWithReturnValue()

let closureWithReturnValue = {() -> Int in
    return 6
}
closureWithReturnValue()

// closure as param
func functionWithClosure(closure:(String)->Void) {
    closure("hidden param")
}
functionWithClosure(closureWithParams)

// Closure als Parameter

// Schreibweisen:
functionWithClosure({(param:String) in
    print("received param: \(param)")
    return
})
functionWithClosure({param in
    print("received param: \(param)")
    return
})
// falls closure letzer parameter
functionWithClosure() { param in
    print("received param: \(param)")
    return
}

