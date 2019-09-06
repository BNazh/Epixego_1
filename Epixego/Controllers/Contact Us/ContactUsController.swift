//
//  ContactUsController.swift
//  Epixego
//
//  Created by Moath Yahia on 9/5/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import SwiftValidator

class ContactUsController: UIViewController {

    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var nameTxt         : UITextField!
    @IBOutlet private weak var emailTxt        : UITextField!
    @IBOutlet private weak var messagetxt      : UITextField!
    @IBOutlet private weak var nameErrorLbl    : UILabel!
    @IBOutlet private weak var emailErrorLbl   : UILabel!
    @IBOutlet private weak var messageErrorLbl : UILabel!
    @IBOutlet private weak var submitBtn       : UIButton!
    
    let validator = Validator()
    var http = HTTPController()
    lazy var contactUsModel = ContactUsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        validation()
        http.delegate = self
    }
    
    private func setupView() {
        CustomDesign.setBackgroundImage(view: self.view)
        CustomDesign.customDesignView(view: containerView)
    }
    
    private func validation() {
    
        validator.styleTransformers(success: {(ValidationRule) -> Void in
            ValidationRule.errorLabel?.isHidden = true
            ValidationRule.errorLabel?.text = ""
            
        }, error: {(ValidationError) -> Void in
            print("error")
            ValidationError.errorLabel?.isHidden = false
            ValidationError.errorLabel?.text = ValidationError.errorMessage
    })
    
        validator.registerField(nameTxt, errorLabel: nameErrorLbl, rules: [RequiredRule()])
        validator.registerField(emailTxt, errorLabel: emailErrorLbl, rules: [RequiredRule(), EmailRule()])
        validator.registerField(messagetxt, errorLabel: messageErrorLbl, rules: [RequiredRule()])
    }

    @IBAction private func submitBtn(sender: UIButton) {
        validator.validate(self)
    }
    
    private func callApi() {
        guard let name = nameTxt.text, let email = emailTxt.text, let message = messagetxt.text else {
            return
        }
        
        let param = ["email": email, "name": name, "message": message]
        http.post(path: "\(APIConstants.baseURl)\(APIConstants.contactUsURL)", parameter: param, tag: 1)
    }
    
    internal func showMessage(tempContactUsModel: ContactUsModel) {
        if tempContactUsModel.success == true {
            self.displayAlertSuccess(title: "Success", message: "Thank you for connected us")
        } else {
            self.displayAlertFailed(title: "Failed", message: "We are sorry, something wrong")
        }
    }
}

extension ContactUsController: ValidationDelegate {
    func validationSuccessful() {
        print("success")
        callApi()
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        
    }
}
