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
    
    static let padding = Float(20)
    static let margin = Float(3)

    private let contentView = UIView()
    private let titleLabel = CommonLabel()
    private let emailLabel = CommonLabel()
    private let emailTextField = CommonTextField()
    private let passwordLabel = CommonLabel()
    private let passwordTextField = CommonTextField()
    private let loginButton = CommonButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupSubviews()
        setupAutoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
  @objc  func pressToVisitAccountsScreen(_ sender: CommonButton) {
    let accountsOverviewVC: UIViewController = AccountsViewController()
    navigationController?.present(accountsOverviewVC, animated: true)
//    self.loginButton.layer.borderColor = .buttonNavyColor

        print("You have successfully logged in!")
    }

}

extension InitialViewController: Subviewable {
    
    internal func setupHierarchy() {
        self.contentView.backgroundColor = .tealBackgroundColor
        self.titleLabel.text = "Login"
        self.emailLabel.text = "Email"
        self.emailLabel.textAlignment = .left
        self.emailTextField.placeholder = "me@gmail.com"
        self.passwordLabel.text = "Password"
        self.passwordLabel.textAlignment = .left
        self.passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        self.loginButton.setTitle("Login",for: .normal)
        self.loginButton.addTarget(self, action: #selector(pressToVisitAccountsScreen(_:)), for: .touchUpInside)

    }
    
    internal func setupSubviews() {
        self.view.addSubview(contentView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(emailTextField)
        self.contentView.addSubview(passwordLabel)
        self.contentView.addSubview(passwordTextField)
        self.contentView.addSubview(loginButton)
        
    }
    
    internal func setupAutoLayout() {
        
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo((topLayoutGuide.snp.bottom)).offset(-InitialViewController.padding)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.5)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailLabel.snp.top)
        }
        
        self.emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailTextField.snp.top).offset(-InitialViewController.margin)
        }
        
        self.emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel.snp.bottom).offset(InitialViewController.margin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalTo(passwordLabel.snp.top).offset(-InitialViewController.padding)
        }
        
        self.passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(InitialViewController.padding)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(passwordTextField.snp.top).offset(-InitialViewController.margin)
        }
        
        self.passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabel.snp.bottom).offset(InitialViewController.margin)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalTo(loginButton.snp.top).offset(-InitialViewController.padding)
        }
        
        self.loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(InitialViewController.padding)
            make.width.equalTo(passwordTextField).multipliedBy(0.7)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-InitialViewController.padding * 4)
        }
    }
}

