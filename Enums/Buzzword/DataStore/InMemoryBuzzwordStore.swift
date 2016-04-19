//
//  InMemoryBuzzwordStore.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

class InMemoryBuzzwordStore: BuzzwordStore {

    var buzzwords = [Buzzword]()
    
    func createBuzzword(word: String) -> Buzzword {
        let created = Buzzword(id:self.buzzwords.count+1, name:word, count:0)
        self.buzzwords.append(created)
        return created
    }
    
    func allBuzzwords() -> [Buzzword] {
        return self.buzzwords
    }
    
    func saveBuzzword(buzzword: Buzzword) {
        self.buzzwords[buzzword.id - 1] = buzzword
    }
}