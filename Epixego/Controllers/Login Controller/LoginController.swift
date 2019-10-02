//
//  LoginController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/8/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit
import SwiftValidator
import SideMenu

class LoginController: UIViewController {

    @IBOutlet fileprivate weak var containerLoginView: UIView!
    @IBOutlet fileprivate weak var containerEmailView: UIView!
    @IBOutlet fileprivate weak var containerPasswordView: UIView!

    @IBOutlet fileprivate weak var emailTxt: UITextField!
    @IBOutlet fileprivate weak var emailErrorLbl: UILabel!

    @IBOutlet fileprivate weak var passwordTxt: UITextField!
    @IBOutlet fileprivate weak var passwordErrorLbl: UILabel!

    @IBOutlet fileprivate weak var SignUpTxt: UITextView!
    @IBOutlet fileprivate weak var loginBtn: UIButton!
    
    lazy var loginModel = LoginModel()
    let validator = Validator()
    var http = HTTPController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTxt.text = "mo3ad_y@hotmail.com"
        passwordTxt.text = "8f7d192c024599846802cad3a7d71e219c19a42ae400421dd5204963ad9c8235edce03aceb5a49200299c4b0419893bd35b7ab79cd77286f37f4b56599a19267"
        
        http.delegate = self
        setupView()

       
        validation()
    }
    
    private func setupView() {
        
        CustomDesign.setBackgroundImage(view: self.view)
        CustomDesign.customDesignView(view: containerLoginView)

        
        CustomDesign.customAnyView(view: loginBtn, cornerRadius: 5.0)
        CustomDesign.customAnyView(view: containerEmailView, cornerRadius: 5, cornerColor: UIColor.lightGray, cornerWidth: 1, shadowColor: nil, shadowRadius: nil, shadowOpacity: nil)
        CustomDesign.customAnyView(view: containerPasswordView, cornerRadius: 5, cornerColor: UIColor.lightGray, cornerWidth: 1, shadowColor: nil, shadowRadius: nil, shadowOpacity: nil)
      
        //Don't have an account? Sign up
        let attributedString = NSMutableAttributedString(string: "Don't have an account? Sign up")
        attributedString.addAttribute(.link, value: "", range: NSRange(location: 23, length: 7))
        
        
        SignUpTxt.attributedText = attributedString
    }
    
    func validation() {
        
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
    }
    
    @IBAction func loginBtn(sender: UIButton) {
        validator.validate(self)
    }
    
    @IBAction func sideBarBtn(sender: UIBarButtonItem) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    func callLoginApi() {
        /*{
         "email": "cugusihif@freemaillink.com",
         "password": "8f7d192c024599846802cad3a7d71e219c19a42ae400421dd5204963ad9c8235edce03aceb5a49200299c4b0419893bd35b7ab79cd77286f37f4b56599a19267",
         "userType": "STUDENT" //
         }*/
        let parameter: [String: String] = ["email": emailTxt.text ?? "",
                         "password": passwordTxt.text ?? "",
                         "userType": "STUDENT"]
        
        http.post(path: APIConstants.baseURl + APIConstants.signInURL, parameter: parameter, tag: 1)
    }
    
    func goToProfile() {
       /* let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.profileUserController) as! ProfileUserController
        controller.loginModel = loginModel
        self.navigationController?.pushViewController(controller, animated: true)*/
        
        let storyboard = UIStoryboard(name: "ProfileStoryboard", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: ConstantControllers.profileUserController) as! ProfileUserController
        controller.loginModel = loginModel
        let navigation = UINavigationController(rootViewController: controller)
        self.present(navigation, animated: true, completion: nil)
    }
    
}

extension LoginController: ValidationDelegate {
    func validationSuccessful() {
        print("success")
        callLoginApi()
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {

    }
    
    
}


extension LoginController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//        UIApplication.shared.open(URL)
  
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.signUpVC)
        
        self.navigationController?.pushViewController(controller!, animated: true)
        return false
    }
}
