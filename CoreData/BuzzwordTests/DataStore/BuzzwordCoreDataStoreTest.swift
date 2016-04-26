//
//  BuzzwordCoreDataStoreTest.swift
//  Buzzword
//
//  Created by Chris Weber on 26.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation
import XCTest
import CoreData
@testable
import Buzzword

class BuzzwordCoreDataStoreTest: XCTestCase {

    var context: NSManagedObjectContext!
    var sut : BuzzwordCoreDataStore!
    
    override func setUp() {
        guard let modelURL = NSBundle.mainBundle().URLForResource("Model", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let objectModel = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: objectModel)
        try! coordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
        context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        sut = BuzzwordCoreDataStore(context:context)
    }
    
    
//    func testSaveBuzzword_Create() {
//        let buzzword = Buzzword(id: 1, name: "Hallo Welt", count: 0)
//        
//        self.sut.saveBuzzword(buzzword)
//        
//        let buzzwords = self.sut.allBuzzwords()
//        XCTAssertEqual(buzzwords[0].id, 1)
//        XCTAssertEqual(buzzwords[0].name, "Hallo Welt")
//        XCTAssertEqual(buzzwords[0].count, 0)
//        XCTAssertFalse(context.hasChanges) // hint: save on managed object context
//    }
//    
//    func testSaveBuzzword_Update() {
//        self.sut.saveBuzzword(Buzzword(id: 1, name: "Hallo Welt", count: 0))
//        let buzzword = Buzzword(id: 1, name: "Hallo Welt2", count: 1)
//        
//        self.sut.saveBuzzword(buzzword)
//        
//        let buzzwords = self.sut.allBuzzwords()
//        XCTAssertEqual(buzzwords.count, 1)
//        XCTAssertEqual(buzzwords[0].id, 1)
//        XCTAssertEqual(buzzwords[0].name, "Hallo Welt2")
//        XCTAssertEqual(buzzwords[0].count, 1)
//        XCTAssertFalse(context.hasChanges)
//    }
//
//    func testSyncBuzzwords() {
//        self.sut.saveBuzzword(Buzzword(id: 1, name: "Hallo Welt", count: 0))
//        let buzzword = Buzzword(id: 1, name: "Hallo Welt2", count: 1)
//        
//        self.sut.syncBuzzwords([buzzword])
//        
//        let buzzwords = self.sut.allBuzzwords()
//        XCTAssertEqual(buzzwords[0].id, 1)
//        XCTAssertEqual(buzzwords[0].name, "Hallo Welt2")
//        XCTAssertEqual(buzzwords[0].count, 1)
//        XCTAssertFalse(context.hasChanges)
//    }
//
//    func testSyncBuzzwords_RemoveBuzzwordsNotInList() {
//        self.sut.saveBuzzword(Buzzword(id: 1, name: "Hallo Welt", count: 0))
//        let buzzword = Buzzword(id: 2, name: "Hallo Welt 2", count: 0)
//        
//        self.sut.syncBuzzwords([buzzword])
//        
//        let buzzwords = self.sut.allBuzzwords()
//        XCTAssertEqual(buzzwords[0].id, 2)
//        XCTAssertEqual(buzzwords[0].name, "Hallo Welt 2")
//        XCTAssertEqual(buzzwords[0].count, 0)
//        XCTAssertFalse(context.hasChanges)
//    }
//
//    func testAllBuzzwords_SortByCountAndName() {
//        self.sut.saveBuzzword(Buzzword(id: 3, name: "First", count: 42))
//        self.sut.saveBuzzword(Buzzword(id: 1, name: "A_Second", count: 0))
//        self.sut.saveBuzzword(Buzzword(id: 2, name: "B_Third", count: 0))
//
//        let buzzwords = self.sut.allBuzzwords()
//        
//        XCTAssertEqual(buzzwords[0].id, 3)
//        XCTAssertEqual(buzzwords[1].id, 1)
//        XCTAssertEqual(buzzwords[2].id, 2)
//    }
    
}