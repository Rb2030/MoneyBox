//
//  InitialViewController.swift
//  MoneyBox_App
//
//  Created by Ross on 27/02/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit
import SnapKit


class InitialViewController: UIViewController {

    private let titleLabel = MoneyBoxLabel()
    private let emailLabel = MoneyBoxLabel()
    private let emailTextField = MoneyBoxTextField()
    private let passwordLabel = MoneyBoxLabel()
    private let passwordTextField = MoneyBoxTextField()
    private let loginButton = MoneyBoxButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupSubviews()
        setupAutoLayout()
    }
    
  @objc  func pressToVisitAccountsScreen(_ sender: MoneyBoxButton) {
    let accountsOverviewVC: UIViewController = AccountsViewController()
    navigationController?.pushViewController(accountsOverviewVC, animated: true)

        print("You have successfully logged in!")
    }

}

extension InitialViewController: Subviewable {
    
    internal func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

    }
    
    internal func setupSubviews() {
        view.backgroundColor = .tealBackgroundColor
        titleLabel.text = String.Localized.login
        emailLabel.text = String.Localized.email
        emailLabel.textAlignment = .left
        emailTextField.placeholder = "me@gmail.com"
        passwordLabel.text = String.Localized.password
        passwordLabel.textAlignment = .left
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        loginButton.setTitle(String.Localized.login,for: .normal)
        loginButton.addTarget(self, action: #selector(pressToVisitAccountsScreen(_:)), for: .touchUpInside)
    }
    
    internal func setupAutoLayout() {
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(view.snp.centerY).multipliedBy(0.5)
            make.centerX.equalToSuperview()
        }
        
        self.emailLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalTo(emailTextField.snp.top).offset(-Layout.labelPadding)
        }
        
        self.emailTextField.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        self.passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(Layout.labelPadding)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        self.passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabel.snp.bottom).offset(Layout.labelPadding)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        self.loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Layout.buttonPadding)
            make.centerX.equalToSuperview()
            make.width.equalTo(passwordTextField).multipliedBy(0.7)
        }
    }
}

