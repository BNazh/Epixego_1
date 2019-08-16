//
//  ItemsSearchPeopleModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/22/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class ItemsSearchPeopleModel: Mappable {
    /* "_index": "epixego_profile_new",
     "_type": "profile",
     "_id": "YitfSGsBGizRVg2qT9lr",
     "_score": 7.0639124,
     "_source": {
     */
    
    var index      : String?
    var type       : String?
    var id         : String?
    var score      : Double?
    var source     : SourceModel?
    
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
