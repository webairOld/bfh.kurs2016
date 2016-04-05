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
    
    init() {
        self.session = FakeNSURLSession()
    }
    
    func createBuzzword(word: String, completion:Buzzword -> Void) {
//        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.test.ch")!)
//        request.HTTPMethod = "POST"
//        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(["name":word], options:NSJSONWritingOptions(rawValue: 0))
//        let task = session.dataTaskWithRequest(request, completionHandler: { (let data, let response, let error) in
//            let body = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0))
//            print("body: \(body)")
//        })
//        task.resume()
    }
    
    func allBuzzwords(completion: [Buzzword] -> Void) {
        
    }
    
    func saveBuzzword(buzzword: Buzzword, completion: Buzzword->Void) {
    }
}