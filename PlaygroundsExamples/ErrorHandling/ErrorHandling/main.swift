//
//  main.swift
//  ErrorHandling
//
//  Created by Chris Weber on 05.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation


enum MyError: ErrorType {
    case SomeCase
    case OtherCase
    case CaseWithParam(Int)
}

class ErrorExample {
    func normalFunction () {
        
    }
    func errorThrowingFunction (willThrowError:Bool) throws  -> String {
        if willThrowError {
            throw MyError.SomeCase
        }
        return "No Error thrown"
    }
    
    func errorWithParamThrowingFunction (willThrowError:Bool) throws  -> String {
        if willThrowError {
            throw MyError.CaseWithParam(3)
        }
        return "No Error thrown"
    }
}

/*** Example  ***/

let exampleClass = ErrorExample()

exampleClass.normalFunction()

// compile error
//exampleClass.errorThrowingFunction(false)

let return1 = try! exampleClass.errorThrowingFunction(false)

// runtime error
//try! exampleClass.errorThrowingFunction(true)

let return2 = try? exampleClass.errorThrowingFunction(true)

// do-catch
do {
    try exampleClass.errorThrowingFunction(true)
} catch  {
    print("catch error")
}

do {
    try exampleClass.errorThrowingFunction(true)
} catch MyError.SomeCase  {
    print("specific catch SomeCase error")
} catch MyError.OtherCase {
    
}

// with params
do {
    try exampleClass.errorWithParamThrowingFunction(true)
} catch MyError.CaseWithParam(let value)  {
    print("specific catch Error with parameter: \(value)")
}

do {
    try exampleClass.errorWithParamThrowingFunction(true)
} catch MyError.CaseWithParam(let value) where value==3  {
    print("specific catch Error with parameter value 3")
} catch MyError.CaseWithParam(let value) where value==2 {
    print("specific catch Error with parameter value 2")
}

