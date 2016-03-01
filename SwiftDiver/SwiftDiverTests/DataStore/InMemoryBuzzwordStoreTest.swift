//
//  InMemoryBuzzwordStoreTest.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import XCTest

@testable
import SwiftDiver

class InMemoryBuzzwordStoreTest: XCTestCase {
    let sut = InMemoryBuzzwordStore()
    
    func testCreateBuzzword() {
        sut.createBuzzword("HTML5")
        
        XCTAssertEqual(sut.allBuzzwords().count, 1)
    }
    
    func testCreateBuzzword_InitialValues() {
        sut.createBuzzword("HTML 5")
        
        XCTAssertEqual(sut.allBuzzwords()[0].id, 1)
        XCTAssertEqual(sut.allBuzzwords()[0].name, "HTML 5")
        XCTAssertEqual(sut.allBuzzwords()[0].count, 0)
    }
    
    func testCreateBuzzword_IncrementIds() {
        sut.createBuzzword("HTML 5")
        sut.createBuzzword("Responsive Design")
        
        XCTAssertEqual(sut.allBuzzwords()[0].id, 1)
        XCTAssertEqual(sut.allBuzzwords()[1].id, 2)
    }
    
    func testSaveBuzzword_IncrementCount() {
        sut.createBuzzword("HTML 5")
        let incrementedBuzzword = sut.allBuzzwords()[0].incrementCount()
        
        sut.saveBuzzword(incrementedBuzzword)
        
        XCTAssertEqual(sut.allBuzzwords()[0].count, 1)
    }
    
}
