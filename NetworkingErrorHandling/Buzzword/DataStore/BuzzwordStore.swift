//
//  BuzzwordStore.swift
//  Buzzword
//
//  Created by Chris Weber on 19.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

protocol BuzzwordStore {
    func allBuzzwords() -> [Buzzword]
    func saveBuzzword(buzzword: Buzzword)
    func syncBuzzwords(buzzwords: [Buzzword])
}
