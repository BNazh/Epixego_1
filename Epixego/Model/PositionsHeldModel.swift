//
//  PositionsHeldModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/12/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class PositionsHeldModel: Mappable {
    /*  "positionsHeld": [
     {
     "companyInstitution": "",
     "industry": "",
     "name": "",
     "duration": "",
     "tags": [],
     "workDescription": ""
     }
     ],*/
    
    var companyInstitution   = String()
    var industry             = String()
    var name                 : String?
    var duration             = String()
    var tags                 = [String]()
    var workDescription      : String?
    var startDate            : String?
    var endDate              : String?
    var bestPartOfWorking    : String?
    var canBeImproved        : String?
    var proudestAcomplishments : String?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name                 <- map["name"]
        companyInstitution     <- map["companyInstitution"]
        industry               <- map["industry"]
        duration               <- map["duration"]
        tags                   <- map["tags"]
        workDescription        <- map["workDescription"]
        startDate              <- map["startDate"]
        endDate                <- map["endDate"]
        bestPartOfWorking      <- map["bestPartOfWorking"]
        canBeImproved          <- map["canBeImproved"]
        proudestAcomplishments <- map["proudestAcomplishments"]
    }
}
