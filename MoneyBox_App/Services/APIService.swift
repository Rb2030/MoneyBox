//
//  APIServices.swift
//  MoneyBox_App
//
//  Created by Ross on 01/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    typealias JSON = [String: Any]
    
    static let shared = APIService()
//    private init() {}
    
    let url = URL(string: "https://api-test00.moneyboxapp.com/")!
    
    let parameters = [
        "Email": "test+env12@moneyboxapp.com", "Password": "Money$$box@107"
        ]
    
    let headers = [
        "AppId": "8cb2237d0679ca88db6464", "Content-Type": "application/json", "appVersion": "4.0.0", "apiVersion": "3.0.0"
    ]
    
    func authenticateUser() {

        let fullURL = "\(url)" + "users/login/"
        
        Alamofire.request(fullURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isFailure {
                print(response.result.error as Any)
            } else {
                let json = response.result.value! as! NSDictionary
                if let session = json["Session"] as? NSDictionary {
                    let token = session["BearerToken"] as! String
                    print(token)
                }
            }
    }
    
//    struct getuserDetails {
//    
//    init(json: JSON) throws {
//        guard let results = json["results"] as? [JSON] else { throw NetworkingError.incorrectNetworkingFunctionality }
//    }
//        
//    }
}
}
