//
//  GenomeModel.swift
//  Epixego
//
//  Created by Moath Yahia on 9/18/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class GenomeModel: Mappable {
    
    var members     : [MembersValuesModel]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        members     <- map["members"]
    }
}
