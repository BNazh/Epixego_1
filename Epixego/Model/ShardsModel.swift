//
//  ShardsModel.swift
//  Epixego
//
//  Created by Moath Yahia on 8/20/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class ShardsModel: Mappable {
    var failed       : Int?
    var successful   : Int?
    var total        : Int?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        failed         <- map["failed"]
        successful     <- map["successful"]
        total          <- map["total"]
    }
}
