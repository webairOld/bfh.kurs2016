//
//  CoreDataStackTest.swift
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

class CoreDataStackTest:XCTestCase {
    
    
    /*
     Will only test if the stack is initialized completly with an sqlite store, configuration is up to you
     */
    func testCreateCoreDataStack() {
        let sut = CoreDataStack.sharedInstance
        
        XCTAssertNotNil(sut.mainContext)
        XCTAssertNotNil(sut.mainContext.persistentStoreCoordinator)
        XCTAssertNotNil(sut.mainContext.persistentStoreCoordinator?.managedObjectModel)
        XCTAssertEqual(sut.mainContext.persistentStoreCoordinator?.persistentStores.count, 1)
        XCTAssertEqual(sut.mainContext.persistentStoreCoordinator?.persistentStores[0].type, NSSQLiteStoreType)
    }
    
}