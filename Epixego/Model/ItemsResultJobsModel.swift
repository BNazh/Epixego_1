//
//  ItemsResultJobsModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class ItemsResultJobsModel: Mappable {
    
    var index      : String?
    var type       : String?
    var id         : String?
    var score      : Double?
    var source     : JobsResultSourceModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        index      <- map["_index"]
        type       <- map["_type"]
        id         <- map["_id"]
        score      <- map["_score"]
        source     <- map["_source"]
    }
    
}
