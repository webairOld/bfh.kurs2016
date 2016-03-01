//
//  Buzzword.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

struct Buzzword {
    let id:Int
    let name:String
    let count:Int
    
    func incrementCount() -> Buzzword {
        return Buzzword(id:self.id, name:self.name, count: self.count+1)
    }
}

