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
        let fetchRequest = NSFetchRequest(entityName: "BuzzwordEntity")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "count", ascending: false),
            NSSortDescriptor(key: "name", ascending: true),
        ]
        let entities = try! self.context.executeFetchRequest(fetchRequest) as! [BuzzwordEntity]
        var buzzwords = [Buzzword]()
        for entity in entities {
            buzzwords.append(Buzzword(id:Int(entity.id!), name:entity.name!, count:Int(entity.count!)))
        }
        return buzzwords
    }
    
    func saveBuzzword(buzzword: Buzzword) {
        let fetchRequest = NSFetchRequest(entityName: "BuzzwordEntity")
        fetchRequest.predicate = NSPredicate(format: "id = %ld", buzzword.id)
        let entities = try! self.context.executeFetchRequest(fetchRequest) as! [BuzzwordEntity]
        
        let entity:BuzzwordEntity
        if entities.count > 0 {
            entity = entities[0]
        } else {
            entity = NSEntityDescription.insertNewObjectForEntityForName("BuzzwordEntity", inManagedObjectContext: self.context) as! BuzzwordEntity
        }
        
        entity.id = buzzword.id
        entity.name = buzzword.name
        entity.count = buzzword.count
        try! context.save()
    }
    
    func syncBuzzwords(buzzwords: [Buzzword]) {
        let idsToKeep = buzzwords.map() {buzzword in return buzzword.id}
        let fetchRequest = NSFetchRequest(entityName: "BuzzwordEntity")
        fetchRequest.predicate = NSPredicate(format: "NOT (id IN %@)", idsToKeep)
        let entitesToRemove = try! self.context.executeFetchRequest(fetchRequest) as! [BuzzwordEntity]
        for entity in entitesToRemove {
            self.context.deleteObject(entity)
        }
        for buzzword in buzzwords {
            self.saveBuzzword(buzzword)
        }
    }
}
