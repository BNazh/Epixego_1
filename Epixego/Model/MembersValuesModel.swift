//
//  MembersValuesModel.swift
//  Epixego
//
//  Created by Moath Yahia on 9/18/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class MembersValuesModel: Mappable {
    
    var name      : String?
    var weight    : Int?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name      <- map["name"]
        weight    <- map["weight"]
    }
}
