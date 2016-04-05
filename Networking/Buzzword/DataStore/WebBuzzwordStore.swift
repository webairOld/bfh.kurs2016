import Foundation

class WebBuzzwordStore: BuzzwordStore {
    
    let session:NSURLSession
    
    init(session:NSURLSession) {
        self.session = session
    }
    
    func buzzword(representation:[String: AnyObject]) -> Buzzword {
        return Buzzword(id:representation["id"] as! Int, name: representation["name"] as! String, count: representation["count"] as! Int)
    }
    
    func performRequest(URLString:String, method:String, body:AnyObject?, completionHandler: (AnyObject?, NSURLResponse?, NSError?) -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: URLString)!)
        request.HTTPMethod = method
        if let HTTPBody = body {
            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(HTTPBody, options:NSJSONWritingOptions(rawValue: 0))
        }
        let task = session.dataTaskWithRequest(request, completionHandler: { (let data, let response, let error) in
            let responseObject: AnyObject?
            if let safeData = data {
                responseObject = try! NSJSONSerialization.JSONObjectWithData(safeData, options: NSJSONReadingOptions(rawValue: 0))
            } else {
                responseObject = nil
            }
            completionHandler(responseObject, response, error)
        })
        task.resume()
    }
    
    
    func createBuzzword(word: String, completion:Buzzword -> Void) {
        self.performRequest("https://buzzword.com/buzzwords", method: "POST", body: ["name":word]) { (let responseObject, let response, let error) in
            let buzzword = self.buzzword(responseObject as! [String:AnyObject])
            completion(buzzword)
        }
    }
    
    func allBuzzwords(completion: [Buzzword] -> Void) {
        
        self.performRequest("https://buzzword.com/buzzwords", method: "GET", body: nil) { (let responseObject, let response, let error) in
            let buzzwordList = responseObject as! [AnyObject]
            var buzzwords = [Buzzword]()
            for buzzwordUncasted in buzzwordList {
                let buzzwordEntry = buzzwordUncasted as! [String: AnyObject]
                let buzzword = self.buzzword(buzzwordEntry)
                buzzwords.append(buzzword)
            }
            completion(buzzwords)
            
        }
    }
    
    func saveBuzzword(buzzword: Buzzword, completion: ()->Void) {
        let jsonBody = ["id":buzzword.id, "name":buzzword.name, "count":buzzword.count]
        self.performRequest("https://buzzword.com/buzzwords/\(buzzword.id)/", method: "PUT", body: jsonBody) { (let data, let response, let error) in
            completion()
        }
    }
}