//
//  ProfileManager.swift
//  Epixego
//
//  Created by Moath Yahia on 9/18/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

extension ProfileUserController: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        
        profileModel = Mapper<ProfileModel>().map(JSON: dicResponse)!
        flagLoadingData = true
        self.tableView.reloadData()
    }
    
    func receivedErrorWithMessage(_ message: String) {
        
    }
    
}
