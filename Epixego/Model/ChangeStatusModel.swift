//
//  ChangeStatusModel.swift
//  Epixego
//
//  Created by Moath Yahia on 8/20/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class ChangeStatusModel: Mappable {
    
    var id               : String?
    var index            : String?
    var primaryTerm      : Int?
    var seqNo            : Int?
    var shareds          : ShardsModel?
    var type             : String?
    var version          : Int?
    var result           : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id                  <- map["_id"]
        index               <- map["_index"]
        primaryTerm         <- map["_primary_term"]
        seqNo               <- map["_seq_no"]
        shareds             <- map["_shards"]
        type                <- map["_type"]
        version             <- map["_version"]
        result              <- map["result"]
    }
}
