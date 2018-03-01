//
//  MoneyBoxButton.swift
//  MoneyBox_App
//
//  Created by Ross on 01/03/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit

class MoneyBoxButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        
        backgroundColor = .lightTealButtonColor
        setTitleColor( .buttonNavyColor, for: .normal)
        setTitleColor( .pageCreamLabelColor, for: .highlighted)
        titleLabel?.font = .buttonFont
        clipsToBounds = true
        setProperties(borderColor: .lightTealButtonColor, borderWidth:1.0, cornerRadius:5.0)
    }
    
    func setProperties(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: Float) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.cornerRadius  = CGFloat(cornerRadius)
    }
    
}

