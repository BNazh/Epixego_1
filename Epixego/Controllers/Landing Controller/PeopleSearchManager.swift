//
//  PeopleSearchManager.swift
//  Epixego
//
//  Created by Moath Yahia on 7/22/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

extension PeopleContainerController: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        
        resutlPeopleSearchModel = Mapper<ResultSearchPeopleModel>().map(JSON: dicResponse)!
        
        goToResultPeopleController()
    }
    
    func receivedErrorWithMessage(_ message: String) {
        
    }
    
    
}
