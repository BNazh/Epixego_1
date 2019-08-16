//
//  PositionInformationModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/12/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class PositionInformationModel: Mappable {
    
    /*"clubsOrgs": [
     {
     "name": "",
     "titlePosition": "",
     "timeCommitment": "",
     "duration": "",
     "tags": []
     }
     ],*/
    
    var titlePosition   : String?
    var timeCommitment  : String?
    var duration        : String?
    var name            : String?
    var tags            : [String]?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        titlePosition     <- map["titlePosition"]
        timeCommitment    <- map["timeCommitment"]
        duration          <- map["duration"]
        name              <- map["name"]
        tags              <- map["tags"]
    }
}
