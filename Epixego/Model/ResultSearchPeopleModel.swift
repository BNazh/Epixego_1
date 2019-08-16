//
//  ResultSearchPeopleModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/22/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class ResultSearchPeopleModel: Mappable {
    
    var total       : Int?
    var items       : [ItemsSearchPeopleModel]?
    var namePeople  : String?
    
    required convenience init(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        total    <- map["total"]
        items    <- map["items"]
    }
}
