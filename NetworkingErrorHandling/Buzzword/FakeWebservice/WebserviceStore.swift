//
//  WebserviceStore.swift
//  Buzzword
//
//  Created by Chris Weber on 26.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

class WebserviceStore {
    
    static var buzzwords = [Buzzword]()
    
    func createBuzzword(word: String) -> Buzzword {
        let created = Buzzword(id:WebserviceStore.buzzwords.count+1, name:word, count:0)
        WebserviceStore.buzzwords.append(created)
        return created
    }
    
    func allBuzzwords() -> [Buzzword] {
        return WebserviceStore.buzzwords
    }
    
    func saveBuzzword(buzzword: Buzzword) {
        WebserviceStore.buzzwords[buzzword.id - 1] = buzzword
    }
}