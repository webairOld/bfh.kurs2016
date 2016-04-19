import Foundation

enum APIResult<T> {
    case Success(T)
    case Failure(String)
}

class BuzzwordAPI {
    
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
    
    
    func createBuzzword(word: String, completion:APIResult<Buzzword> -> Void) {
        self.performRequest("https://buzzword.com/buzzwords", method: "POST", body: ["name":word]) { (let responseObject, let response, let error) in
            if let httpResponse = response as! NSHTTPURLResponse? {
                if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                    let buzzword = self.buzzword(responseObject as! [String:AnyObject])
                    completion(APIResult.Success(buzzword))
                } else if httpResponse.statusCode >= 400 && httpResponse.statusCode < 500 {
                    completion(APIResult.Failure("Request Error"))
                } else if httpResponse.statusCode >= 500 && httpResponse.statusCode < 600 {
                    completion(APIResult.Failure("Server Error"))
                }
            } else {
                completion(APIResult.Failure(error!.localizedDescription))
            }
        }
    }
    
    func allBuzzwords(completion: APIResult<[Buzzword]> -> Void) {
        
        self.performRequest("https://buzzword.com/buzzwords", method: "GET", body: nil) { (let responseObject, let response, let error) in
            let buzzwordList = responseObject as! [AnyObject]
            var buzzwords = [Buzzword]()
            for buzzwordUncasted in buzzwordList {
                let buzzwordEntry = buzzwordUncasted as! [String: AnyObject]
                let buzzword = self.buzzword(buzzwordEntry)
                buzzwords.append(buzzword)
            }
            //completion(buzzwords)
            
        }
    }
    
    func saveBuzzword(buzzword: Buzzword, completion: (APIResult<Bool>)->Void) {
        let jsonBody = ["id":buzzword.id, "name":buzzword.name, "count":buzzword.count]
        self.performRequest("https://buzzword.com/buzzwords/\(buzzword.id)/", method: "PUT", body: jsonBody) { (let data, let response, let error) in
            //completion()
        }
    }
}