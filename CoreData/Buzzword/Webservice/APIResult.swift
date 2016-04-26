//
//  APIResult.swift
//  Buzzword
//
//  Created by Chris Weber on 26.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case Success(T)
    case Failure(String)
    case NetworkError(NSError)
}