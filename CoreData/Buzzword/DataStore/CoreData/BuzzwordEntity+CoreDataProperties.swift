//
//  BuzzwordEntity+CoreDataProperties.swift
//  Buzzword
//
//  Created by Chris Weber on 26.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension BuzzwordEntity {

    @NSManaged var count: NSNumber?
    @NSManaged var id: NSNumber?
    @NSManaged var name: String?

}
