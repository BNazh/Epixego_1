//
//  SignUpController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/10/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import SwiftValidator
import SideMenu

class SignUpController: UIViewController {

    @IBOutlet fileprivate weak var containerSignUpView: UIView!
    @IBOutlet fileprivate weak var containerEmailView: UIView!
    @IBOutlet fileprivate weak var containerPasswordView: UIView!
    @IBOutlet fileprivate weak var containerConfirmPasswordView: UIView!
    
    @IBOutlet fileprivate weak var emailTxt: UITextField!
    @IBOutlet fileprivate weak var passwordTxt: UITextField!
    @IBOutlet fileprivate weak var confirmPasswordTxt: UITextField!
    
    @IBOutlet fileprivate weak var signUpBtn: UIButton!

    @IBOutlet fileprivate weak var signInTxt:UITextView!
    
    @IBOutlet fileprivate weak var emailErrorLbl: UILabel!
    @IBOutlet fileprivate weak var passwordErrorLbl: UILabel!
    @IBOutlet fileprivate weak var confimePasswordErrorLbl: UILabel!

    lazy var validator = Validator()
    
    lazy var sourceModel = SourceModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTxt.text = "12345678"
        confirmPasswordTxt.text = "12345678"
        emailTxt.text = "yedrafisto@desoz.com"
        
        setupView()
    }
    
    func setupView() {
        
        CustomDesign.customDesignView(view: containerSignUpView)
        CustomDesign.setBackgroundImage(view: self.view)

        //Sign in if you already have an account or click here if you're an employer.
        let attributedString = NSMutableAttributedString(string: "Sign in if you already have an account or click here if you're an employer.")
        attributedString.addAttribute(.link, value: "", range: NSRange(location: 0, length: 7))
        attributedString.addAttribute(.link, value: "", range: NSRange(location: 42, length: 10))
        
        
        signInTxt.attributedText = attributedString
        
        validation()
    }
    
    private func validation() {
        
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
        
        validator.registerField(emailTxt, errorLabel: emailErrorLbl, rules: [RequiredRule(), EmailRule()])
        validator.registerField(passwordTxt, errorLabel: passwordErrorLbl, rules: [RequiredRule(), MinLengthRule(length: 8)])
        validator.registerField(confirmPasswordTxt, errorLabel: confimePasswordErrorLbl, rules: [RequiredRule(), ConfirmationRule(confirmField: passwordTxt)])
        
    }
    
    @IBAction func signUpBtn(sender: UIButton) {

      /*  validate.textfield = emailTxt
        validate.textfield = passwordTxt

        validate.setup()
        validate.checkValidator()*/
        validator.validate(self)
    }
    
    @IBAction func sideBarBtn(sender: UIBarButtonItem) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
}

extension SignUpController: ValidationDelegate {
    func validationSuccessful() {
        print("Success")
        let generalInformation = GeneralInfoModel()
        generalInformation.email = emailTxt.text ?? ""
        generalInformation.password = passwordTxt.text ?? ""
        
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.secondSignUpVC) as? SecondStepSignUpController
        controller?.generalInformation = generalInformation
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        print("failed")
    }
    
    
}

extension SignUpController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if characterRange.location == 0 {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
            
            self.navigationController?.pushViewController(controller, animated: true)
        } else if characterRange.location == 42 {
            print("ou're an employer")
        }
        return false
    }
}
