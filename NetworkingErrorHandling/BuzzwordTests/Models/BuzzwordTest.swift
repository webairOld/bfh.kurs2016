//
//  BuzzwordTest.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import XCTest

@testable
import Buzzword

class BuzzwordTest: XCTestCase {
    
    func testIncrementCount() {
        let buzzword = Buzzword(id:1, name:"Any", count:0)
        
        let incrementedBuzzword = buzzword.incrementCount()
        
        XCTAssertEqual(incrementedBuzzword.count, 1)
    }
    
}
