//
//  ResultJobsModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class ResultJobsModel: Mappable {
    
    var total     : Int?
    var items     : [ItemsResultJobsModel]?
    
    
    required convenience init(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        total    <- map["total"]
        items    <- map["items"]
    }
        
}
