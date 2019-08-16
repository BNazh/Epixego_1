//
//  GeneralInfoResultJobsModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class GeneralInfoResultJobsModel: Mappable {
    
    var companyInstitution     : String?
    var locationCity           : String?
    var locationState          : String?
    var locationCountry        : String?
    var url                    : String?
    var contactEmail           : String?
    var jobType                : String?
    var timeCommitment         : Int?
    var duration               : Int?
    var jobExpiry              : String?
    var jobDescription         : String?
    var position               : String?
    var postedDate             : String?
    
    required convenience init(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        companyInstitution    <- map["companyInstitution"]
        locationCity          <- map["locationCity"]
        locationState         <- map["locationState"]
        locationCountry       <- map["locationCountry"]
        url                   <- map["url"]
        contactEmail          <- map["contactEmail"]
        jobType               <- map["jobType"]
        timeCommitment        <- map["timeCommitment"]
        duration              <- map["duration"]
        jobExpiry             <- map["jobExpiry"]
        jobDescription        <- map["jobDescription"]
        position              <- map["position"]
        postedDate            <- map["postedDate"]
    }
}
