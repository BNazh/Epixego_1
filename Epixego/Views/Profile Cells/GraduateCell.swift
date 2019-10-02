//
//  GraduateCell.swift
//  Epixego
//
//  Created by Moath Yahia on 9/29/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class GraduateCell: UITableViewCell {

    @IBOutlet private weak var graduationYearTxt    : UITextField!
    @IBOutlet private weak var nameTxt              : UITextField!
    @IBOutlet private weak var countryTxt           : UITextField!
    @IBOutlet private weak var stateTxt             : UITextField!
    @IBOutlet private weak var cityTxt              : UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        graduationYearTxt.delegate = self
        nameTxt.delegate           = self
        countryTxt.delegate        = self
        stateTxt.delegate          = self
        cityTxt.delegate           = self
    }

    
}


extension GraduateCell: UITextFieldDelegate {
    
}
