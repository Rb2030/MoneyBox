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
    
    let url = "https://api-test00.moneyboxapp.com/users/login/"
    
    let parameters = [
        "AppId": "8cb2237d0679ca88db6464", "Content-Type": "application/json", "appVersion": "4.0.0", "apiVersion": "3.0.0"
        ]
    
    let headers = [
        "Authorization": "Bearer TsMWRkbrcu3NGrpf84gi2+pg0iOMVymyKklmkY0oI84="
    ]
    
    
    func authenticateUser(Email:String, Password:String) {
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            print(response)
//            if response.result.isFailure {
//                print("Error")
//            }else {
//            print("Success")
//            }
        }
    }
}
