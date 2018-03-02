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
    
    let headers = [
        "AppId" : "8cb2237d0679ca88db6464",
        "Content-Type" : "application/json",
        "appVersion" : "4.0.0",
        "apiVersion" : "3.0.0"
    ]
    
    private let baseUrl = "https://api-test00.moneyboxapp.com"
    
    func request(extension: String, parameters: [String: String]?) {
        Alamofire.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
        
            if response.result.isFailure {
                print("Failed")
            } else {
                print(response)
            }
        }
    }
}
