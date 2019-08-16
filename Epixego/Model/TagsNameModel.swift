//
//  TagsNameModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/12/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper


class TagsNameModel: Mappable {

    var name   : String?
    var tags   : [String]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        name    <- map["name"]
        tags    <- map["tags"]
        
    }
}
