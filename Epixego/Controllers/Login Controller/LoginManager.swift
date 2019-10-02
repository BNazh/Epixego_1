//
//  LoginManager.swift
//  Epixego
//
//  Created by Moath Yahia on 7/11/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import ObjectMapper

extension LoginController: HttpControllerDelegate {
 
    func receivedResponseArray(_ dicResponse: [String: Any], tag: Int) {

        loginModel = Mapper<LoginModel>().map(JSON: dicResponse)!
        
        UserDefaultDB.shared.addUserDefaultString(value: loginModel.token ?? "", key: DBLocalKeys.token)
        UserDefaultDB.shared.addUserDefaultString(value: loginModel.userId ?? "", key: DBLocalKeys.userId)
        UserDefaultDB.shared.addUserDefaultString(value: loginModel.type ?? "", key: DBLocalKeys.type)
        
        goToProfile()
    }
    
    func receivedErrorWithMessage(_ message: String) {
        print("error")
    }
}
