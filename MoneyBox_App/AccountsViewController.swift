//
//  AccountsViewController.swift
//  MoneyBox_App
//
//  Created by Ross on 01/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    
    private let contentView = UIView()
    private let titleLabel = MoneyBoxLabel()
    
    static let padding = Float(20)
    static let margin = Float(3)


    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupSubviews()
        setupAutoLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
                navigationController?.navigationBar.isHidden = false
    }
    
}

extension AccountsViewController: Subviewable {
    
    internal func setupHierarchy() {
        self.contentView.backgroundColor = .tealBackgroundColor
        self.titleLabel.text = String.Localized.yourAccounts
        
    }
    
    internal func setupSubviews() {
        self.view.addSubview(contentView)
        self.contentView.addSubview(titleLabel)
    }
    
    internal func setupAutoLayout() {
        
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo((view.snp.top)).offset(-Layout.labelPadding)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
//            make.bottom.equalTo([AccountsButton(0)].snp.top)
        }
    }
    
}
