//
//  InMemoryBuzzwordStore.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

class WebBuzzwordStore: BuzzwordStore {

    let session:NSURLSession
    
    init(session:NSURLSession) {
        self.session = session
    }
    
    func createBuzzword(word: String, completion:Buzzword -> Void) {
    }
    
    func allBuzzwords(completion: [Buzzword] -> Void) {
    }
    
    func saveBuzzword(buzzword: Buzzword, completion: ()->Void) {
    }
}