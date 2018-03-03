//
//  AccountsViewController.swift
//  MoneyBox_App
//
//  Created by Ross on 01/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    
    private let titleLabel = MoneyBoxLabel()
    private let stocksSharesIsaButton = AccountsButton()
    private let gIAButton = AccountsButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupSubviews()
        setupAutoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
                navigationController?.navigationBar.isHidden = false
    }
    
    @objc  func pressToVisitStocksSharesScreen(_ sender: MoneyBoxButton) {
        let stocksSharesVC: UIViewController = StocksAndSharesViewController()
        navigationController?.pushViewController(stocksSharesVC, animated: true)
        
        print("User chose to view Stocks & Shares VC!")
    }
    
    @objc  func pressToVisitGeneralInvestmentScreen(_ sender: MoneyBoxButton) {
        let generalInvestmentVC: UIViewController = GeneralInvestmentViewController()
        navigationController?.pushViewController(generalInvestmentVC, animated: true)
        
        print("User chose to view General Investment Account VC!")
    }
    
}

extension AccountsViewController: Subviewable {
    
    internal func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(stocksSharesIsaButton)
        view.addSubview(gIAButton)
        
    }
    
    internal func setupSubviews() {
        view.backgroundColor = .tealBackgroundColor
        titleLabel.text = String.Localized.yourAccounts
        stocksSharesIsaButton.setTitle(String.Localized.stocksAndSharesISA,for: .normal)
        stocksSharesIsaButton.addTarget(self, action: #selector(pressToVisitStocksSharesScreen(_:)), for: .touchUpInside)
        gIAButton.setTitle(String.Localized.generalInvestmentAccount, for: .normal)
        gIAButton.addTarget(self, action: #selector(pressToVisitGeneralInvestmentScreen(_:)), for: .touchUpInside)

    }
    
    internal func setupAutoLayout() {
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY).multipliedBy(0.3)
            make.centerX.equalToSuperview()
        }
        
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
