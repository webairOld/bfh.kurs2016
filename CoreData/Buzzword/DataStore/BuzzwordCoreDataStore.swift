//
//  BuzzwordCoreDataStore.swift
//  Buzzword
//
//  Created by Chris Weber on 26.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation
import CoreData

class BuzzwordCoreDataStore:BuzzwordStore {
    let context: NSManagedObjectContext

    convenience init() {
        self.init(context:CoreDataStack.sharedInstance.mainContext)
    }
    
    init(context:NSManagedObjectContext) {
        self.context = context

    }
    
    func allBuzzwords() -> [Buzzword] {
        return [Buzzword]()
    }
    
    func saveBuzzword(buzzword: Buzzword) {
        
    }
    
    func syncBuzzwords(buzzwords: [Buzzword]) {
        
    }
}
