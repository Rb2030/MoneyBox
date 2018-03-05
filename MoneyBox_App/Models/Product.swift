//
//  Product.swift
//  MoneyBox_App
//
//  Created by Ross on 04/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import Foundation

struct ProductData: Codable {
    
    var products: [Product]
}

extension ProductData {
    private enum CodingKeys: String, CodingKey {
        case products = "Products"
    }
}

struct Product: Codable {
    
    var type: String
    var id: Int
    var moneyBox: Int
}

extension Product {
    private enum CodingKeys: String, CodingKey {
        case type = "InvestorProductType"
        case id = "InvestorProductId"
        case moneyBox = "Moneybox"

    }
}
