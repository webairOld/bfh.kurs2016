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

class BuzzwordInMemoryStoreTest: XCTestCase {
    let sut = BuzzwordInMemoryStore()
    
    override func setUp() {
        // empty store
        BuzzwordInMemoryStore.buzzwords = [Buzzword]()
    }

    func testSaveBuzzword() {
        let buzzword = Buzzword(id: 1, name: "Hallo Welt", count: 0)
        
        self.sut.saveBuzzword(buzzword)
        
        let buzzwords = self.sut.allBuzzwords()
        XCTAssertEqual(buzzwords[0].id, 1)
        XCTAssertEqual(buzzwords[0].name, "Hallo Welt")
        XCTAssertEqual(buzzwords[0].count, 0)
    }
    
    func testSaveBuzzword_Update() {
        self.sut.saveBuzzword(Buzzword(id: 1, name: "Hallo Welt", count: 0))
        let buzzword = Buzzword(id: 1, name: "Hallo Welt2", count: 1)
        
        self.sut.saveBuzzword(buzzword)
        
        let buzzwords = self.sut.allBuzzwords()
        XCTAssertEqual(buzzwords.count, 1)
        XCTAssertEqual(buzzwords[0].id, 1)
        XCTAssertEqual(buzzwords[0].name, "Hallo Welt2")
        XCTAssertEqual(buzzwords[0].count, 1)
    }
    
    func testSyncBuzzwords() {
        self.sut.saveBuzzword(Buzzword(id: 1, name: "Hallo Welt", count: 0))
        let buzzword = Buzzword(id: 1, name: "Hallo Welt2", count: 1)
        
        self.sut.syncBuzzwords([buzzword])
        
        let buzzwords = self.sut.allBuzzwords()
        XCTAssertEqual(buzzwords[0].id, 1)
        XCTAssertEqual(buzzwords[0].name, "Hallo Welt2")
        XCTAssertEqual(buzzwords[0].count, 1)
    }
    
    func testSyncBuzzwords_RemoveBuzzwordsNotInList() {
        self.sut.saveBuzzword(Buzzword(id: 1, name: "Hallo Welt", count: 0))
        let buzzword = Buzzword(id: 2, name: "Hallo Welt 2", count: 0)
        
        self.sut.syncBuzzwords([buzzword])
        
        let buzzwords = self.sut.allBuzzwords()
        XCTAssertEqual(buzzwords[0].id, 2)
        XCTAssertEqual(buzzwords[0].name, "Hallo Welt 2")
        XCTAssertEqual(buzzwords[0].count, 0)
    }
    
    func testAllBuzzwords_SortByCountAndName() {
        self.sut.saveBuzzword(Buzzword(id: 1, name: "A_Second", count: 0))
        self.sut.saveBuzzword(Buzzword(id: 2, name: "B_Third", count: 0))
        self.sut.saveBuzzword(Buzzword(id: 3, name: "First", count: 42))
        
        let buzzwords = self.sut.allBuzzwords()
        
        XCTAssertEqual(buzzwords[0].id, 3)
        XCTAssertEqual(buzzwords[1].id, 1)
        XCTAssertEqual(buzzwords[2].id, 2)
    }
    
}
