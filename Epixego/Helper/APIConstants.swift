//
//  APIConstants.swift
//  Epixego
//
//  Created by Moath Yahia on 7/10/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

struct APIConstants {
    // 3000 backend
    //8080 frontend
    //http://13.56.79.215:8080
//    http://localhost:3000/epixego/
    static let baseURl: String = "http://18.144.12.142:3000/epixego/"
// http://13.56.79.215:3000/
    //http://13.56.158.13:8080
    //52.53.183.115:8080
    static let signInURL: String = "signIn"
    
    static let profileURL: String = "profile/"
    
    static let profileRegsiterURL: String = "profile/register"
    
    static let uploadImageURL: String = "uploadImage"
    
    static let uploadResumeURL: String = "uploadResume"
    
    static let searchPeopleURL: String = "profile/search/"
    
    static let findPeopleURL: String = "findPeople"

    static let searchInternshipURL: String = "internship/search/"
    
//    localhost:3000/epixego/getjobwithstatus/eCxSRWwBGizRVg2qNjNH
    static let searchJobStatusURL: String = "findJobs4Candidate/"
    
    static let changeStatusURL: String = "changeStatus/"
    
    static let contactUsURL: String = "email"
    
    static let uploadURL: String = "uploads/"
    
    static let partialUpdateURL: String = "profile/partialUpdate/"
}
