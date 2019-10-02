//
//  ResponsePartialProfileModel.swift
//  Epixego
//
//  Created by Moath Yahia on 9/17/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class ResponsePartialProfileModel: Mappable {
    
    var shareds          : ShardsModel?
    var result           : String?
    var id               : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        shareds   <- map["_shards"]
        result    <- map["result"]
        id        <- map["_id"]
    }
}
