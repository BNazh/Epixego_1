//
//  SourceModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/11/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class SourceModel: Mappable {
    
    var generalInfo               : GeneralInfoModel?
    var ikigaiInfo                : IkigaiInfoModel?
    var highschoolInfo            : HighschoolInfoModel?
    var collegeInfo               : SchoolInfoModel?
    var graduateInfo              : SchoolInfoModel?
    var earlyProfessionalInfo     : ProfessionalExperienceInfoModel?
    var advancedProfessionalInfo  : ProfessionalExperienceInfoModel?
    var jobs                      : [JobsModel]?

    /*
    var ikigaiInfo      : IkigaiInfoModel?
     var highschoolInfo  : highschoolInfo?
     var collegeInfo     : collegeInfo?
     var graduateInfo    : graduateInfo?
     var earlyProfessionalInfo   : earlyProfessionalInfo?
     var advancedProfessionalInfo: advancedProfessionalInfo?
 
 */
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        generalInfo              <- map["generalInfo"]
        ikigaiInfo               <- map["ikigaiInfo"]
        highschoolInfo           <- map["highschoolInfo"]
        collegeInfo              <- map["collegeInfo"]
        graduateInfo             <- map["graduateInfo"]
        earlyProfessionalInfo    <- map["earlyProfessionalInfo"]
        advancedProfessionalInfo <- map["advancedProfessionalInfo"]
        jobs                     <- map["jobs"]
    }
    /*  "generalInfo": {
     "name": "moath yahia",
     "email": "cugusihif@freemaillink.com",
     "password": "8f7d192c024599846802cad3a7d71e219c19a42ae400421dd5204963ad9c8235edce03aceb5a49200299c4b0419893bd35b7ab79cd77286f37f4b56599a19267",
     "birthYear": "0",
     "gender": "",
     "locationCity": "san jose",
     "locationState": "",
     "locationCountry": "",
     "profilePicture": "",
     "resume": [],
     "liProfile": "",
     "fbProfile": "",
     "selfVideo": "",
     "level": "ep",
     "profileType": "Normal",
     "admin": false,
     "followers": "",
     "following": "",
     "internshipKeywords": "",
     "confirmationhash": "0551d8db81d4e84c994588e719771eec14cef58ac905fc08d1cc8c44e74226fb",
     "expiration": 1562884794169,
     "isConfirmed": true
     },
     "ikigaiInfo": {
     "selfDescribe": "",
     "othersDescribe": "",
     "comesEasy": "",
     "favoriteActivity": "",
     "aspireTo": "",
     "improveWorld": "",
     "successfulPerson": "",
     "whatMakesSuccess": ""
     },
     "highschoolInfo": {
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
     "collegeInfo": {
     "name": "",
     "locationCity": "",
     "locationState": "",
     "locationCountry": "",
     "graduationYear": "0",
     "majorMinor": [
     {
     "name": "",
     "tags": []
     }
     ],
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
     "graduateInfo": {
     "name": "",
     "locationCity": "",
     "locationState": "",
     "locationCountry": "",
     "graduationYear": "0",
     "majorMinor": [
     {
     "name": "",
     "tags": []
     }
     ],
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
     "earlyProfessionalInfo": {
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
     "advancedProfessionalInfo": {
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
     }*/
}
