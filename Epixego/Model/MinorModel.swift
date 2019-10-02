//
//  MinorModel.swift
//  Epixego
//
//  Created by Moath Yahia on 9/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class MinorModel: Mappable {
    
    var name    : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name    <- map["name"]
    }
}
