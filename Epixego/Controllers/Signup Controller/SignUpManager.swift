//
//  SignUpManager.swift
//  Epixego
//
//  Created by Moath Yahia on 7/15/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

extension SecondStepSignUpController: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        print(dicResponse)
        
        signUpResposeModel = Mapper<SignUpResposeModel>().map(JSON: dicResponse)!
      
        UserDefaultDB.shared.addUserDefaultString(value: signUpResposeModel.token ?? "", key: DBLocalKeys.token)
        UserDefaultDB.shared.addUserDefaultString(value: signUpResposeModel.userId ?? "", key: DBLocalKeys.userId)
        UserDefaultDB.shared.addUserDefaultString(value: signUpResposeModel.email ?? "", key: DBLocalKeys.email)

        goToVerficationView()
        
    }
    
    func receivedErrorWithMessage(_ message: String) {
        print("error")
    }
    
    
}
