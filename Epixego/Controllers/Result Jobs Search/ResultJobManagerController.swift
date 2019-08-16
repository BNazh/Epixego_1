//
//  ResultJobManagerController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/31/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

extension ResultJobSearchController: HttpControllerDelegate {
   
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        
        let tempResultJobsModel = Mapper<ResultJobsModel>().map(JSON: dicResponse)!
        itemsResultJobModel += tempResultJobsModel.items ?? []
        
        if (tempResultJobsModel.items?.count ?? 0) > 0 {
            self.tableView.reloadData()
            fetchData = false

        }
    }
    
    func receivedErrorWithMessage(_ message: String) {
        
    }
}

