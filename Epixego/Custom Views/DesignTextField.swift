//
//  DesignTextField.swift
//  Epixego
//
//  Created by Moath Yahia on 7/5/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class DesignTextField: UITextField {

    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

    override func draw(_ rect: CGRect) {

        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
        
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    

}
