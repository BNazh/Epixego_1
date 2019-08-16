//
//  DesignButton.swift
//  Epixego
//
//  Created by Moath Yahia on 7/5/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class DesignButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

        self.layer.cornerRadius = 5.0
//        self.layer.borderColor = UIColor.white.cgColor
//        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true

    }
    

}
