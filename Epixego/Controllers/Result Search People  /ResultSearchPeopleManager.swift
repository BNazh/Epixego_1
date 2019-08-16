//
//  ResultSearchPeopleManager.swift
//  Epixego
//
//  Created by Moath Yahia on 8/1/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import ObjectMapper

extension ResultSearchPeopleController: HttpControllerDelegate {
    
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        
        let tempResult = Mapper<ResultSearchPeopleModel>().map(JSON: dicResponse)!
        itemResultPeopleModel += tempResult.items ?? []
        
        if (tempResult.items?.count ?? 0) > 0 {
            self.tableView.reloadData()
            fetchData = false
        }
    }
    
    func receivedErrorWithMessage(_ message: String) {
        
    }
}
