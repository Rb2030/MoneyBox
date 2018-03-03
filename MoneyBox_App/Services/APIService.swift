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
    
    let url = URL(string: "https://api-test00.moneyboxapp.com/")!
    
    let parameters = [
//        "AppId": "8cb2237d0679ca88db6464", "Content-Type": "application/json", "appVersion": "4.0.0", "apiVersion": "3.0.0"
        "Email": "test+env12@moneyboxapp.com", "Password": "Money$$box@107"
        ]
    
    let headers = [
        "Authorization": "Bearer TsMWRkbrcu3NGrpf84gi2+pg0iOMVymyKklmkY0oI84="
    ]
    
    
    func authenticateUser() {

//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            print(data.count) // you can parse your json data here
//            }.resume()
        
        let fullURL = "\(url)" + "users/login/"
        
        Alamofire.request(fullURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            print(response.result)
            debugPrint(response)
//            if response.result.isFailure {
//                print("Error")
//            }else {
//            print("Success")
//            }
        }
    }
}
