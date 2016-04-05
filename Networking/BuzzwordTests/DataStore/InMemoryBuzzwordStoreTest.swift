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
        sut.createBuzzword("HTML5") {buzzword in}
        
        sut.allBuzzwords() {buzzwords in
            XCTAssertEqual(buzzwords.count, 1)
        }
    }
    
    func testCreateBuzzword_InitialValues() {
        sut.createBuzzword("HTML 5") {buzzword in
            XCTAssertEqual(buzzword.id, 1)
            XCTAssertEqual(buzzword.name, "HTML 5")
            XCTAssertEqual(buzzword.count, 0)
        }
    }
    
    func testCreateBuzzword_IncrementIds() {
        sut.createBuzzword("HTML 5"){_ in}
        sut.createBuzzword("Responsive Design") {_ in}
        
        sut.allBuzzwords() {buzzwords in
            XCTAssertEqual(buzzwords[0].id, 1)
            XCTAssertEqual(buzzwords[1].id, 2)
        }

    }

// implement incrementCount first -> see BuzzwordTest.swift
    func testSaveBuzzword_IncrementCount() {
        sut.createBuzzword("HTML 5") {buzzword in
            self.sut.saveBuzzword(buzzword.incrementCount()) {_ in
                self.sut.allBuzzwords() {buzzwords in
                    XCTAssertEqual(buzzwords[0].count, 1)
                }
            }
        }
    }
    
}
