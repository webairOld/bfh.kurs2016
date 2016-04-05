//
//  WebBuzzwordStoreTest.swift
//  Buzzword
//
//  Created by Chris Weber on 05.04.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import XCTest

@testable
import Buzzword

class FakeNSURLSession:NSURLSession{
    let dataTask = FakeNSURLSessionDataTask()
    
    func fake(data:NSData?, response:NSHTTPURLResponse?, error:NSError?) {
        self.dataTask.fakeData = data
        self.dataTask.fakeError = error
        self.dataTask.fakeResponse = response
        self.dataTask.shouldCallCompletion = true
    }
    
    override func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
        self.dataTask.request = request
        self.dataTask.completionHandler = completionHandler
        
        return self.dataTask
    }
}

class FakeNSURLSessionDataTask: NSURLSessionDataTask {
    
    var fakeData: NSData?
    var fakeResponse: NSHTTPURLResponse?
    var fakeError: NSError?
    var shouldCallCompletion = false
    
    var request:NSURLRequest!
    var completionHandler: ( (NSData?, NSURLResponse?, NSError?) -> Void )!
    
    override func resume() {
        if shouldCallCompletion {
            self.completionHandler?(fakeData, fakeResponse, fakeError)
        }

    }
}

class WebBuzzwordStoreTest: XCTestCase {
    var session: FakeNSURLSession!
    var sut: WebBuzzwordStore!

    override func setUp() {
        self.session = FakeNSURLSession()
        self.sut = WebBuzzwordStore(session: self.session)
    }
    
    func HTTPResponse(statusCode:Int) -> NSHTTPURLResponse {
        return NSHTTPURLResponse(URL: NSURL(string:"https://buzzword.com/buzzwords")!, statusCode: statusCode, HTTPVersion: nil, headerFields: nil)!
    }
    
//    func testCreateBuzzword_CallWebservice() {
//        
//        sut.createBuzzword("any") { _ in }
//    
//        XCTAssertEqual("https://buzzword.com/buzzwords", session.dataTask.request!.URL!.absoluteString)
//        XCTAssertEqual("POST", session.dataTask.request!.HTTPMethod!)
//    }
//    
//    func testCreateBuzzword_SerializeJSON() {
//        sut.createBuzzword("Buzzword") { _ in }
//        
//        do {
//            let jsonBody = try NSJSONSerialization.JSONObjectWithData(session.dataTask.request!.HTTPBody!, options:NSJSONReadingOptions(rawValue: 0))
//            let requestBody = jsonBody as! [String: String]
//            XCTAssertEqual(requestBody["name"], "Buzzword")
//         } catch {
//            XCTFail("HTTP Body is not in JSON format")
//        }
//    }
//    
//    func testCreateBuzzword_DeserializeResponse() {
//        let data = "{\"id\":1,\"name\":\"Buzzword\", \"count\":0}".dataUsingEncoding(NSUTF8StringEncoding)
//        session.fake(data, response: self.HTTPResponse(201), error: nil)
//        
//        let exp = self.expectationWithDescription("call completion")
//        sut.createBuzzword("Buzzword") { buzzword in
//            exp.fulfill()
//            XCTAssertEqual(buzzword.id, 1)
//            XCTAssertEqual(buzzword.name, "Buzzword")
//            XCTAssertEqual(buzzword.count, 0)
//
//        }
//        self.waitForExpectationsWithTimeout(0.0, handler: nil)
//    }
//    
//    func testAllBuzzwords_CallWebservice() {
//        sut.allBuzzwords() { _ in }
//        
//        XCTAssertEqual("https://buzzword.com/buzzwords", session.dataTask.request!.URL!.absoluteString)
//        XCTAssertEqual("GET", session.dataTask.request!.HTTPMethod!)
//    }
//    
//    func testAllBuzzwords_DeserializeResponse() {
//        let data = "[{\"id\":1,\"name\":\"Buzzword\", \"count\":0}, {\"id\":2,\"name\":\"Buzzword2\", \"count\":1}]".dataUsingEncoding(NSUTF8StringEncoding)
//        session.fake(data, response: self.HTTPResponse(200), error: nil)
//        
//        let exp = self.expectationWithDescription("call completion")
//        sut.allBuzzwords() { buzzwords in
//            exp.fulfill()
//            XCTAssertEqual(buzzwords[0].id, 1)
//            XCTAssertEqual(buzzwords[0].name, "Buzzword")
//            XCTAssertEqual(buzzwords[0].count, 0)
//            
//            XCTAssertEqual(buzzwords[1].id, 2)
//            XCTAssertEqual(buzzwords[1].name, "Buzzword2")
//            XCTAssertEqual(buzzwords[1].count, 1)
//        }
//        
//        self.waitForExpectationsWithTimeout(0.0, handler: nil)
//
//        
//        XCTAssertEqual("https://buzzword.com/buzzwords", session.dataTask.request!.URL!.absoluteString)
//        XCTAssertEqual("GET", session.dataTask.request!.HTTPMethod!)
//    }
//    
//    func testSaveBuzzwords_CallWebservice() {
//        sut.saveBuzzword(Buzzword(id:1, name:"Buzzword", count:1)) { _ in }
//        
//        XCTAssertEqual("https://buzzword.com/buzzwords/1/", session.dataTask.request!.URL!.absoluteString)
//        XCTAssertEqual("PUT", session.dataTask.request!.HTTPMethod!)
//    }
//    
//    
//    func testSaveBuzzword_SerializeJSON() {
//        let buzzword = Buzzword(id:1, name:"Buzzword", count:2)
//        
//        sut.saveBuzzword(buzzword) { _ in }
//        
//        do {
//            let jsonBody = try NSJSONSerialization.JSONObjectWithData(session.dataTask.request!.HTTPBody!, options:NSJSONReadingOptions(rawValue: 0))
//            let requestBody = jsonBody as! [String: AnyObject]
//            XCTAssertEqual(requestBody["id"] as? Int, 1)
//            XCTAssertEqual(requestBody["name"] as? String, "Buzzword")
//            XCTAssertEqual(requestBody["count"] as? Int, 2)
//        } catch {
//            XCTFail("HTTP Body is not in JSON format")
//        }
//    }
//
//    func testSaveBuzzword_DeserializeResponse() {
//        let buzzword = Buzzword(id:1, name:"Buzzword", count:2)
//        session.fake(nil, response: self.HTTPResponse(204), error: nil)
//        
//        let exp = self.expectationWithDescription("call completion")
//        sut.saveBuzzword(buzzword) {
//            exp.fulfill()
//        }
//        self.waitForExpectationsWithTimeout(0.0, handler: nil)
//    }
}
