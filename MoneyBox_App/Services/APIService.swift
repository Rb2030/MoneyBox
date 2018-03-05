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
    
//    typealias JSON = [String: Any]
//
//    static let shared = APIService()
//    private init() {}
    
    let url = "https://api-test00.moneyboxapp.com/"
        
    func authenticateUser(with parameters: [String: String], completion: @escaping(_ token:String?, _ success:Bool, _ errorString: String?)->Void) {
        
        let headers = [
            "AppId": "8cb2237d0679ca88db6464", "Content-Type": "application/json", "appVersion": "4.0.0", "apiVersion": "3.0.0"
        ]
        
        let fullURL = url + "users/login/"
        
        Alamofire.request(fullURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isFailure {
                completion(nil, false, response.error.debugDescription)
                print(response.result.error as Any)
            } else {
                let json = response.result.value! as! NSDictionary
                if let session = json["Session"] as? NSDictionary {
                    let bearerToken = session["BearerToken"] as! String
                    completion(bearerToken, true, nil)
                    print(bearerToken)
                }
            }
        }
    }
    
    
    
    func getProductForThisWeek(with token: String, completion: @escaping(_ investorProduct:Data?, _ success:Bool, _ errorString: String?)->Void) {
        
        let authHeaders = ["AppId": "8cb2237d0679ca88db6464", "Content-Type": "application/json", "appVersion": "4.0.0", "apiVersion": "3.0.0", "Authorization": "Bearer " + token]

        let fullURL = url + "investorproduct/thisweek"

        Alamofire.request(fullURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: authHeaders).responseJSON { (response) in
            if response.result.isFailure {
                print(response.result.error as Any)
                completion(nil, false, response.error.debugDescription)
            } else {
                let products = response.data
                completion(products, true, nil)
            }
        }
    }
    
    func makeOneOffPayment(with id: Int, and token: String, completion: @escaping(_ success:Bool, _ errorString: String?)->Void) {
        
        let authHeaders = ["AppId": "8cb2237d0679ca88db6464", "Content-Type": "application/json", "appVersion": "4.0.0", "apiVersion": "3.0.0", "Authorization": "Bearer " + token]
        
        let parameters = ["Amount": "10", "InvestorProductId": "\(id)"]
        
        let fullURL = url + "oneoffpayments/"
        
        Alamofire.request(fullURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: authHeaders).responseJSON { (response) in
            if response.result.isFailure {
                print(response.result.error as Any)
                completion(false, response.error.debugDescription)
            } else {
                print(response.result.value)
                completion(true, nil)
            }
        }
    }
    

}
