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
   
    func receivedResponseArray(_ dicResponse: [String: Any], tag: Int) {
      
        switch tag {
        case 1:
            let tempResultJobsModel = Mapper<ResultJobsModel>().map(JSON: dicResponse)!
            itemsResultJobModel += tempResultJobsModel.items ?? []
            
            if (tempResultJobsModel.items?.count ?? 0) > 0 {
                self.tableView.reloadData()
                fetchData = false
            }
        case 2:
            let tempResult = Mapper<ResultJobsModel>().map(JSON: dicResponse)!
            if flagFilter {
                itemsResultJobModel.removeAll()
            }
            itemsResultJobModel += tempResult.items ?? []
            
            self.tableView.reloadData()
            
        default:
            print("default")
        }
    }
    
    func receivedErrorWithMessage(_ message: String) {
        
    }
}

