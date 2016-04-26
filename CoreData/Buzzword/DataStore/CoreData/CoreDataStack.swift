//
//  CoreDataStack.swift
//  Buzzword
//
//  Created by Chris Weber on 26.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

    static let sharedInstance = CoreDataStack()
    
    let mainContext: NSManagedObjectContext
    
    private init() {
        self.mainContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    }
}
