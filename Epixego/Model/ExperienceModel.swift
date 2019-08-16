//
//  ExperienceModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class experienceModel: Mappable {
    /*
     "majors": [],
     "level": ""
     */
    
    var majors     : [String]?
    var level      : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        majors      <- map["majors"]
        level       <- map["level"]
    }
}

