//
//  Strings+Extension.swift
//  MoneyBox_App
//
//  Created by Ross on 01/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: "", table: nil)
    }
    
    enum Localized {
 
        static let login = "Login".localized
        static let email = "Email".localized
        static let password = "Password".localized
        static let yourAccounts = "Your_Accounts".localized
        static let stocksAndSharesISA = "Stocks_&_Shares_ISA__>".localized
        static let generalInvestmentAccount = "General_Investment_Account__>".localized
        static let stocksAndSharesISALabel = "Stocks_&_Shares_ISA".localized
        static let yourMoneybox = "Your_Moneybox_Total:".localized
        static let addTenPoundsToMB = "Add_£10_to_your_Moneybox".localized
        static let generalInvestmentAccountLabel = "General_Investment_Account".localized
    }
}
