//
//  JobsModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/22/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class JobsModel: Mappable {
    
    var resume    : String?
    var jobId     : String?
    var status    : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        resume     <- map["resume"]
        jobId      <- map["job_id"]
        status     <- map["status"]
    }
}
