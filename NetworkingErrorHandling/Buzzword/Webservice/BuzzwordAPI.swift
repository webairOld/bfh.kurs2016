import Foundation



class BuzzwordAPI {
    
    let connector:APIConnector
    
    convenience init () {
        self.init(connector:APIConnector())
    }
    
    init(connector:APIConnector) {
        self.connector = connector
    }
    
    func buzzword(representation:[String: AnyObject]) -> Buzzword {
        return Buzzword(id:representation["id"] as! Int, name: representation["name"] as! String, count: representation["count"] as! Int)
    }
    
    func createBuzzword(word: String, completion:APIResult<Buzzword> -> Void) {
        connector.performRequest("https://buzzword.com/buzzwords", method: "POST", body: ["name":word]) { result in
            switch(result) {
            case .Success(let responseObject):
                let buzzword = self.buzzword(responseObject as! [String:AnyObject])
                completion(.Success(buzzword))
            case .Failure(let errorMessage):
                completion(.Failure(errorMessage))
            case .NetworkError(let error):
                completion(.NetworkError(error))
            }
        }
    }
    
    func allBuzzwords(completion: APIResult<[Buzzword]> -> Void) {
        connector.performRequest("https://buzzword.com/buzzwords", method: "GET", body: nil) { result in
            switch(result) {
            case .Success(let responseObject):
                    var buzzwords = [Buzzword]()
                    let buzzwordList = responseObject as! [AnyObject]
                    for buzzwordUncasted in buzzwordList {
                        let buzzwordEntry = buzzwordUncasted as! [String: AnyObject]
                        let buzzword = self.buzzword(buzzwordEntry)
                        buzzwords.append(buzzword)
                    }
                    completion(.Success(buzzwords))
            case .Failure(let errorMessage):
                completion(.Failure(errorMessage))
            case .NetworkError(let error):
                completion(.NetworkError(error))
            }
        }
    }
    
    func saveBuzzword(buzzword: Buzzword, completion: (APIResult<Any>)->Void) {
        let jsonBody = ["id":buzzword.id, "name":buzzword.name, "count":buzzword.count]
        connector.performRequest("https://buzzword.com/buzzwords/\(buzzword.id)/", method: "PUT", body: jsonBody, completion: completion)
    }
}