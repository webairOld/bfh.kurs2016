//
//  InMemoryBuzzwordStore.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

class InMemoryBuzzwordStore: BuzzwordStore {

    static var buzzwords = [Buzzword]()
    
    func allBuzzwords() -> [Buzzword] {
        return InMemoryBuzzwordStore.buzzwords.sort() {(let first, second) in
            let isBefore: Bool
            if first.count == second.count {
                let comparisonResult = first.name.localizedCaseInsensitiveCompare(second.name)
                isBefore = comparisonResult == NSComparisonResult.OrderedAscending
            } else {
                isBefore = first.count > second.count
            }
            return isBefore
        }
    }
    
    func buzzwordIndex(buzzword:Buzzword) -> Int? {
        return InMemoryBuzzwordStore.buzzwords.indexOf() {existingBuzzword in
            existingBuzzword.id == buzzword.id
        }
    }
    
    func saveBuzzword(buzzword: Buzzword) {
        if let updateIndex = self.buzzwordIndex(buzzword) {
            InMemoryBuzzwordStore.buzzwords.removeAtIndex(updateIndex)
            InMemoryBuzzwordStore.buzzwords.insert(buzzword, atIndex: updateIndex)
        } else {
            InMemoryBuzzwordStore.buzzwords.append(buzzword)
        }
    }
    
    func syncBuzzwords(buzzwords: [Buzzword]) {
        // save all buzzwords
        for buzzword in buzzwords {
            self.saveBuzzword(buzzword)
        }
        
        // remove buzzwords not in list
        var removeIndices = [Int]()
        for (i, buzzword) in InMemoryBuzzwordStore.buzzwords.enumerate() {
            let foundIndex = buzzwords.indexOf() {existingBuzzword in
                existingBuzzword.id == buzzword.id
            }
            if foundIndex == nil {
                removeIndices.append(i)
            }
        }
        removeIndices = removeIndices.sort({$1 < $0})
        for toRemove in removeIndices
        {
            InMemoryBuzzwordStore.buzzwords.removeAtIndex(toRemove)
        }
    }
}