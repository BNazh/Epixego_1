//
//  InternShipSearchManager.swift
//  Epixego
//
//  Created by Moath Yahia on 7/26/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import ObjectMapper

extension InternshipContainerController: HttpControllerDelegate {
   
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        resultJobsModel = Mapper<ResultJobsModel>().map(JSON: dicResponse)!
        goToResultDetailsController()
    }
    
    func receivedErrorWithMessage(_ message: String) {
        
        self.displayAlertViewMessage(title: "No Data", message: "We don't have data in \(keyWordStr)")
    }
    
    
}
