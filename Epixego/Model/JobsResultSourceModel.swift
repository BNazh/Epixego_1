//
//  JobsResultSourceModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class JobsResultSourceModel: Mappable {
    
    /*
     {
     "generalInfo": {
     "companyInstitution": "BMW of North America LLC.",
     "locationCity": "Oxnard",
     "locationState": " CA 93033",
     "locationCountry": "USA",
     "url": "https://www.indeed.com/viewjob?jk=efdf4ed12a466ac9",
     "contactEmail": "",
     "jobType": "",
     "timeCommitment": 0,
     "duration": 0,
     "jobExpiry": "",
     "jobDescription": "Description\n.",
     "position": "Computer Engineering Internship",
     "postedDate": 1563380875490
     },
     "experience": {
     "majors": [],
     "level": ""
     },
     "desiredSkills": [],
     "recruiter": "lSuLBGsBGizRVg2qPleO",
     "applicants": [],
     "views": []
     }
     */
    
    var generalInfo            : GeneralInfoResultJobsModel?
    var experience             : experienceModel?
    
    var desiredSkills          : [String]?
    var recruiter              : String?
    var applicants             : [String]?
    var views                  : [String]?

    required convenience init(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        generalInfo       <- map["generalInfo"]
        experience        <- map["experience"]
        desiredSkills     <- map["desiredSkills"]
        recruiter         <- map["recruiter"]
        applicants        <- map["applicants"]
        views             <- map["views"]
    }
}
