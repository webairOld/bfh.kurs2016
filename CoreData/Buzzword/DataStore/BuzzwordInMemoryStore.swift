//
//  InMemoryBuzzwordStore.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

class BuzzwordInMemoryStore: BuzzwordStore {

    static var buzzwords = [Buzzword]()
    
    func allBuzzwords() -> [Buzzword] {
        return BuzzwordInMemoryStore.buzzwords.sort() {(let first, second) in
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
        return BuzzwordInMemoryStore.buzzwords.indexOf() {existingBuzzword in
            existingBuzzword.id == buzzword.id
        }
    }
    
    func saveBuzzword(buzzword: Buzzword) {
        if let updateIndex = self.buzzwordIndex(buzzword) {
            BuzzwordInMemoryStore.buzzwords.removeAtIndex(updateIndex)
            BuzzwordInMemoryStore.buzzwords.insert(buzzword, atIndex: updateIndex)
        } else {
            BuzzwordInMemoryStore.buzzwords.append(buzzword)
        }
    }
    
    func syncBuzzwords(buzzwords: [Buzzword]) {
        // save all buzzwords
        for buzzword in buzzwords {
            self.saveBuzzword(buzzword)
        }
        
        // remove buzzwords not in list
        var removeIndices = [Int]()
        for (i, buzzword) in BuzzwordInMemoryStore.buzzwords.enumerate() {
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
            BuzzwordInMemoryStore.buzzwords.removeAtIndex(toRemove)
        }
    }
}