//
//  HighschoolInfoModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/12/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class HighschoolInfoModel: Mappable {
    
    var name                    : String?
    var locationCity            : String?
    var locationState           : String?
    var locationCountry         : String?
    var graduationYear          : String?
    var favoriteSubjects        : [TagsNameModel]?
    var sportsGames             : [PositionInformationModel]?
    var clubsOrgs               : [PositionInformationModel]?
    var jobsInternshipsProjects : [PositionInformationModel]?
    var otherInterests          : [PositionInformationModel]?
    var otherTraining           : [TagsNameModel]?
    var impactfulActivities     : [TagsNameModel]?
    var proudestAcomplishments  : [String]?
    /*        "highschoolInfo": {
     "name": "",
     "locationCity": "",
     "locationState": "",
     "locationCountry": "",
     "graduationYear": "0",
     "favoriteSubjects": [
     {
     "name": "",
     "tags": []
     }
     ],
     "sportsGames": [
     {
     "name": "",
     "titlePosition": "",
     "timeCommitment": "",
     "duration": "",
     "tags": []
     }
     ],
     "clubsOrgs": [
     {
     "name": "",
     "titlePosition": "",
     "timeCommitment": "",
     "duration": "",
     "tags": []
     }
     ],
     "jobsInternshipsProjects": [
     {
     "name": "",
     "timeCommitment": "",
     "duration": "",
     "tags": []
     }
     ],
     "otherInterests": [
     {
     "name": "",
     "titlePosition": "",
     "timeCommitment": "",
     "duration": "",
     "tags": []
     }
     ],
     "otherTraining": [
     {
     "name": "",
     "tags": []
     }
     ],
     "impactfulActivities": [
     {
     "name": "",
     "tags": []
     }
     ],
     "proudestAcomplishments": []
     },
     */
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name                     <- map["name"]
        locationCity             <- map["locationCity"]
        locationState            <- map["locationState"]
        locationCountry          <- map["locationCountry"]
        graduationYear           <- map["graduationYear"]
        favoriteSubjects         <- map["favoriteSubjects"]
        sportsGames              <- map["sportsGames"]
        clubsOrgs                <- map["clubsOrgs"]
        jobsInternshipsProjects  <- map["jobsInternshipsProjects"]
        otherInterests           <- map["otherInterests"]
        otherTraining            <- map["otherTraining"]
        impactfulActivities      <- map["impactfulActivities"]
        proudestAcomplishments   <- map["proudestAcomplishments"]
    }
}
