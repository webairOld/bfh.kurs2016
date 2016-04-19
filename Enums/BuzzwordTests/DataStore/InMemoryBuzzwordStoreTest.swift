//
//  InMemoryBuzzwordStoreTest.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import XCTest

@testable
import Buzzword

class InMemoryBuzzwordStoreTest: XCTestCase {
    let sut = InMemoryBuzzwordStore()
    
    func testCreateBuzzword() {
        _ = sut.createBuzzword("HTML5")
        
        let allBuzzwords = sut.allBuzzwords()
        
        XCTAssertEqual(allBuzzwords.count, 1)
    }
    
    func testCreateBuzzword_InitialValues() {
        let buzzword = sut.createBuzzword("HTML 5")
        
        XCTAssertEqual(buzzword.id, 1)
        XCTAssertEqual(buzzword.name, "HTML 5")
        XCTAssertEqual(buzzword.count, 0)
    }

    func testCreateBuzzword_IncrementIds() {
        _ = sut.createBuzzword("HTML 5")
        _ = sut.createBuzzword("Responsive Design")
        
        let buzzwords = sut.allBuzzwords()
        
        XCTAssertEqual(buzzwords[0].id, 1)
        XCTAssertEqual(buzzwords[1].id, 2)
    }

// implement incrementCount first -> see BuzzwordTest.swift
    func testSaveBuzzword_IncrementCount() {
        let buzzword = sut.createBuzzword("HTML 5")
        self.sut.saveBuzzword(buzzword.incrementCount())
        
        let buzzwords = self.sut.allBuzzwords()
        
        XCTAssertEqual(buzzwords[0].count, 1)
    }
    
}
