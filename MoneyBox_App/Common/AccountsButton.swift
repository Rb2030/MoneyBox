//
//  AccountsButton.swift
//  MoneyBox_App
//
//  Created by Ross on 01/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit

class AccountsButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        
        self.backgroundColor = .buttonNavyColor
        self.setTitleColor( .buttonPinkColor, for: .normal)
        self.setTitleColor( .lightTealButtonColor, for: .highlighted)
        self.titleLabel?.font = UIFont(name: "SFUIDisplay-Ultralight", size: 25)
        self.clipsToBounds = true
        self.setProperties(borderColor: .buttonPinkColor, borderWidth:1.0, cornerRadius:5.0)
    }
    
    func setProperties(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: Float) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.cornerRadius  = CGFloat(cornerRadius)
    }
}
