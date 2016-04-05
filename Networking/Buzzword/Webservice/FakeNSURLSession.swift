//
//  FakeNSURLSession.swift
//  Buzzword
//
//  Created by Chris Weber on 04.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import Foundation

class FakeNSURLSession: NSURLSession {
    override func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
        let dataTask = BuzzwordDataTask()
        dataTask.request = request
        dataTask.completionHandler = completionHandler
        
        return dataTask
    }
}

class BuzzwordDataTask: NSURLSessionDataTask {
    static let store = InMemoryBuzzwordStore()
    var request: NSURLRequest?
    var completionHandler: ((NSData?, NSURLResponse?, NSError?) -> Void)?
    
    override func resume() {
        let store = BuzzwordDataTask.store
        let requestPayload = try! NSJSONSerialization.JSONObjectWithData(self.request!.HTTPBody!, options:NSJSONReadingOptions(rawValue: 0)) as! [String:String]
        
        store.createBuzzword(requestPayload["name"]!, completion:{ buzzword in
            let response = NSHTTPURLResponse(URL: self.request!.URL!, statusCode: 200, HTTPVersion: nil, headerFields: nil)!
            let data = try! NSJSONSerialization.dataWithJSONObject(["id":buzzword.id, "name":buzzword.name, "count":buzzword.count], options:NSJSONWritingOptions(rawValue: 0))
            self.completionHandler!(data, response, nil)
        })
    }
}
