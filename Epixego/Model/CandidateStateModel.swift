//
//  CandidateStateModel.swift
//  Epixego
//
//  Created by Moath Yahia on 8/20/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class CandidateStateModel: Mappable {
    var flag      : String?
    var id        : String?
    var state     : String?
    var time      : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        flag     <- map["flag"]
        id       <- map["id"]
        state    <- map["state"]
        time     <- map["time"]
    }
}
