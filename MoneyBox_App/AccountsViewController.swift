//
//  AccountsViewController.swift
//  MoneyBox_App
//
//  Created by Ross on 01/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    
    private let stocksSharesIsaButton = AccountsButton()
    private let gIAButton = AccountsButton()
    var token: String!
    private var products = [Product]()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupSubviews()
        setupAutoLayout()
        getProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
                navigationController?.navigationBar.isHidden = false
    }
    
    @objc  func pressToVisitStocksSharesScreen(_ sender: MoneyBoxButton) {
        for product in products {
            if product.type == "Isa" {
                let stocksSharesVC = StocksAndSharesViewController()
                stocksSharesVC.product = product
                stocksSharesVC.token = token
                navigationController?.pushViewController(stocksSharesVC, animated: true)
            }
            
        }
        
        print("User chose to view Stocks & Shares VC!")
    }
    
    @objc  func pressToVisitGeneralInvestmentScreen(_ sender: MoneyBoxButton) {
        for product in products {
            if product.type == "Gia" {
                let generalInvestmentVC = GeneralInvestmentViewController()
                generalInvestmentVC.product = product
                generalInvestmentVC.token = token
                navigationController?.pushViewController(generalInvestmentVC, animated: true)
            }
        }
    }
    
     func getProducts() {
        let service = APIService()
        service.getProductForThisWeek(with: token){ productsJSON, success, error in
            if success {
                do {
                    let decoder = JSONDecoder()
                    let productData = try decoder.decode(ProductData.self, from: productsJSON!)
                    self.products = productData.products
                    self.showAccountButtons(products: productData.products)
                } catch let error {
                    print(error)
                }
            } else {
                print("Error getting token \(String(describing: error))")
            }
        }
    }
    
    private func showAccountButtons(products: [Product]) {
        for product in products {
            if product.type == "Isa" {
                stocksSharesIsaButton.isHidden = false
            } else if product.type == "Gia" {
                    gIAButton.isHidden = false
            }
        }
    }
    
}

extension AccountsViewController: Subviewable {
    
    internal func setupHierarchy() {
        view.addSubview(stocksSharesIsaButton)
        view.addSubview(gIAButton)
        
    }
    
    internal func setupSubviews() {
        view.backgroundColor = .tealBackgroundColor
        title = String.Localized.yourAccounts
        stocksSharesIsaButton.setTitle(String.Localized.stocksAndSharesISA,for: .normal)
        stocksSharesIsaButton.addTarget(self, action: #selector(pressToVisitStocksSharesScreen(_:)), for: .touchUpInside)
        stocksSharesIsaButton.isHidden = true
        gIAButton.setTitle(String.Localized.generalInvestmentAccount, for: .normal)
        gIAButton.addTarget(self, action: #selector(pressToVisitGeneralInvestmentScreen(_:)), for: .touchUpInside)
        gIAButton.isHidden = true

    }
    
    internal func setupAutoLayout() {
        
        self.stocksSharesIsaButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(stocksSharesIsaButton.snp.width).multipliedBy(0.2)
            make.bottom.equalTo(gIAButton.snp.top).offset(-Layout.buttonPadding)
        }
        
        self.gIAButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(stocksSharesIsaButton)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
}
