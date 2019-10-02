//
//  ProfessionalExperienceInfoModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/12/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper


class  ProfessionalExperienceInfoModel: Mappable {
  
    var positionsHeld           : [PositionsHeldModel]?
    var clubsOrgs               : [PositionInformationModel]?
    var otherInterests          : [PositionInformationModel]?
    var impactfulActivities     : [TagsNameModel]?
    var proudestAcomplishments  : [String]?
    var bestPartOfWorking       : String?
    var canBeImproved           : String?
    var aspirationalRole        : String?
    var adviceToSelf            : String?
    
    
    /*        "earlyProfessionalInfo": {
     "positionsHeld": [
     {
     "companyInstitution": "",
     "industry": "",
     "name": "",
     "duration": "",
     "tags": [],
     "workDescription": ""
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
     "otherInterests": [
     {
     "name": "",
     "titlePosition": "",
     "timeCommitment": "",
     "duration": "",
     "tags": []
     }
     ],
     "impactfulActivities": [
     {
     "name": "",
     "tags": []
     }
     ],
     "proudestAcomplishments": [],
     "bestPartOfWorking": "",
     "canBeImproved": "",
     "aspirationalRole": "",
     "adviceToSelf": ""
     },
*/
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        positionsHeld            <- map["positionsHeld"]
        clubsOrgs                <- map["clubsOrgs"]
        otherInterests           <- map["otherInterests"]
        impactfulActivities      <- map["impactfulActivities"]
        proudestAcomplishments   <- map["proudestAcomplishments"]
        bestPartOfWorking        <- map["bestPartOfWorking"]
        canBeImproved            <- map["canBeImproved"]
        aspirationalRole         <- map["aspirationalRole"]
        adviceToSelf             <- map["adviceToSelf"]
    }
}
