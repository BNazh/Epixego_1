//
//  LandingEmployeeManager.swift
//  Epixego
//
//  Created by Moath Yahia on 8/15/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import ObjectMapper

extension LandingEmployerController: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
     
        resutlPeopleSearchModel = Mapper<ResultSearchPeopleModel>().map(JSON: dicResponse)!
        goToInfoSearchPoeple()
    }
    
    func receivedErrorWithMessage(_ message: String) {
        
    }
    
    
}
