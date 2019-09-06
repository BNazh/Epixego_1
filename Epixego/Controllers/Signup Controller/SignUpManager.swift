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
    func receivedResponseArray(_ dicResponse: [String: Any], tag: Int) {
        
        switch tag {
        case 1:
            signUpResposeModel = Mapper<SignUpResposeModel>().map(JSON: dicResponse)!
            
            UserDefaultDB.shared.addUserDefaultString(value: signUpResposeModel.token ?? "", key: DBLocalKeys.token)
            UserDefaultDB.shared.addUserDefaultString(value: signUpResposeModel.userId ?? "", key: DBLocalKeys.userId)
            UserDefaultDB.shared.addUserDefaultString(value: signUpResposeModel.email ?? "", key: DBLocalKeys.email)
            
            goToVerficationView()
        case 2:
            statusUploadModel = Mapper<StatusUploadModel>().map(JSON: dicResponse)!
            imageProfileString = statusUploadModel.filename ?? ""
            profilePicLbl.text = imageProfileString
        default:
            print("defaults")
        }
    }
    
    func receivedErrorWithMessage(_ message: String) {
        print("error")
    }
}
