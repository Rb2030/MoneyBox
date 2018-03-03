//
//  StocksAndSharesViewController.swift
//  MoneyBox_App
//
//  Created by Ross on 03/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit

class StocksAndSharesViewController: UIViewController {
    
    private let pagetitleLabel = MoneyBoxLabel()
    private let totalAccountLabel = UILabel()
    private let accountTitleLabel = MoneyBoxLabel()
    private let moneyBoxAmountLabel = UILabel()
    private let addFundsButton = MoneyBoxButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupSubviews()
        setupAutoLayout()
    }

}

extension StocksAndSharesViewController: Subviewable {
    
    internal func setupHierarchy() {
        view.addSubview(pagetitleLabel)
        view.addSubview(totalAccountLabel)
        view.addSubview(accountTitleLabel)
        view.addSubview(moneyBoxAmountLabel)
        view.addSubview(addFundsButton)
    }

    internal func setupSubviews() {
        view.backgroundColor = .tealBackgroundColor
        pagetitleLabel.text = String.Localized.stocksAndSharesISALabel
        totalAccountLabel.numberOfLines = 0
        accountTitleLabel.text = String.Localized.yourMoneybox
        accountTitleLabel.textAlignment = .left
        addFundsButton.setTitle(String.Localized.addTenPoundsToMB,for: .normal)
        addFundsButton.setTitleColor( .buttonPinkColor, for: .highlighted)

    }

    internal func setupAutoLayout() {
        
        self.pagetitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().multipliedBy(0.3)
            make.centerX.equalToSuperview()
        }
        
        self.totalAccountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pagetitleLabel.snp.bottom).offset(Layout.labelPadding)
            make.width.equalToSuperview()
        }
        
        self.accountTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(totalAccountLabel.snp.bottom).offset(Layout.margin * 2)
            make.leading.equalToSuperview().offset(Layout.margin)
        }
        
        self.moneyBoxAmountLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(accountTitleLabel.snp.trailing)
            make.top.equalTo(accountTitleLabel)
            make.bottom.equalTo(accountTitleLabel)
        }
        
        self.addFundsButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
    }

}

