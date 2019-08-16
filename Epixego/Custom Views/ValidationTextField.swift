//
//  ValidationTextField.swift
//  Epixego
//
//  Created by Moath Yahia on 7/10/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import SwiftValidator

class ValidationTextField: ValidationDelegate {
     
     var textfield = UITextField()
     var errorTextfieldLbl = UILabel()

     var validator = Validator()
    
     func setup() {

        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("here")
            // clear error label
            validationRule.errorLabel?.isHidden = true
            validationRule.errorLabel?.text = ""
        }, error:{ (validationError) -> Void in
            print("error")
            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage
        })
        
        validator.registerField(textfield , errorLabel: errorTextfieldLbl, rules: [RequiredRule()])
        
    }
    
    func checkValidator() {
        validator.validate(self)
    }
    
    func validationSuccessful() {
        print("success")
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        print("error")
    }
}
