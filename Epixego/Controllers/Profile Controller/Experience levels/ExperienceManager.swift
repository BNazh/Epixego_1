//
//  ExperienceManager.swift
//  Epixego
//
//  Created by Moath Yahia on 9/26/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

extension ExperienceController: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        responseModel = Mapper<ResponsePartialProfileModel>().map(JSON: dicResponse)!
        showMessage()

    }
    
    func receivedErrorWithMessage(_ message: String) {
        
    }
    
    
}
