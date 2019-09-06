//
//  ContactUsManager.swift
//  Epixego
//
//  Created by Moath Yahia on 9/5/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import ObjectMapper
import UIKit

extension ContactUsController: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        
        contactUsModel = Mapper<ContactUsModel>().map(JSON: dicResponse)!
        showMessage(tempContactUsModel: contactUsModel)
    }
    
    func receivedErrorWithMessage(_ message: String) {
        print(message)
    }
}
