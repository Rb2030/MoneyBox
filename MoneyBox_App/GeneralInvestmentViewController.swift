//
//  GeneralInvestmentViewController.swift
//  MoneyBox_App
//
//  Created by Ross on 03/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit

class GeneralInvestmentViewController: UIViewController {


    private let moneyBoxAmountLabel = MoneyBoxLabel()
    private let addFundsButton = MoneyBoxButton()
    
    var product: Product!
    var token: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupSubviews()
        setupAutoLayout()
        print(product)
    }
    
    @objc private func buttonTapped() {
        let service = APIService()
        service.makeOneOffPayment(with: product.id, and: token){ success, error in
            if success {
            self.product.moneyBox += 10
            self.moneyBoxAmountLabel.text = String.Localized.yourMoneybox + " " + String(describing: self.product.moneyBox)
            print("You added a tenner!")
            } else {
                print("Error getting token \(String(describing: error))")
            }
        }
    }
}
    


extension GeneralInvestmentViewController: Subviewable {
    
    internal func setupHierarchy() {
        view.addSubview(moneyBoxAmountLabel)
        view.addSubview(addFundsButton)
    }
    
    internal func setupSubviews() {
        view.backgroundColor = .tealBackgroundColor
        title = String.Localized.generalInvestmentAccountLabel
        moneyBoxAmountLabel.numberOfLines = 0
        moneyBoxAmountLabel.text = String.Localized.yourMoneybox + " " + String(describing: product.moneyBox)
        addFundsButton.setTitle(String.Localized.addTenPoundsToMB,for: .normal)
        addFundsButton.setTitleColor( .buttonPinkColor, for: .highlighted)
        addFundsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        
    }
    
    internal func setupAutoLayout() {
        
   
        self.moneyBoxAmountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY).multipliedBy(0.5)
            make.width.equalToSuperview()
        }
        
        self.addFundsButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
    }

    
}

