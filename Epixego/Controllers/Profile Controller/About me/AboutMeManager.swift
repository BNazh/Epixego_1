//
//  AboutMeManager.swift
//  Epixego
//
//  Created by Moath Yahia on 9/11/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

extension AboutMeController: HttpControllerDelegate {
    
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        
        responseModel = Mapper<ResponsePartialProfileModel>().map(JSON: dicResponse)!
        showMessage()
    }
    
    func receivedErrorWithMessage(_ message: String) {
        
    }
}
