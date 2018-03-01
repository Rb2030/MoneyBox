//
//  CommonLabel.swift
//  MoneyBox_App
//
//  Created by Ross on 28/02/2018.
//  Copyright © 2018 Ross. All rights reserved.
//

import UIKit

class CommonLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        self.textColor = .pageCreamLabelColor
        self.numberOfLines = 0
        self.textAlignment = .center
        self.font = 
    }
}

