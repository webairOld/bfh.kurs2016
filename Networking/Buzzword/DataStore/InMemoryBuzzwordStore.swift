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
    
    func createBuzzword(word: String, completion:Buzzword -> Void) {
        let created = Buzzword(id:self.buzzwords.count+1, name:word, count:0)
        self.buzzwords.append(created)
        completion(created)
    }
    
    func allBuzzwords(completion: [Buzzword] -> Void) {
        completion(buzzwords)
    }
    
    func saveBuzzword(buzzword: Buzzword, completion:Buzzword -> Void) {
        self.buzzwords[buzzword.id - 1] = buzzword
        completion(buzzword)
    }
}