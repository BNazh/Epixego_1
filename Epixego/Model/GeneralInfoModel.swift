//
//  GeneralInfoModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/12/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class GeneralInfoModel: Mappable {

    var name                : String?
    var email               : String?
    var password            : String?
    var birthYear           : String?
    var gender              : String?
    var locationCity        : String?
    var locationState       : String?
    var locationCountry     : String?
    var profilePicture      : String?
    var resume              : [String]?
    var liProfile           : String?
    var fbProfile           : String?
    var selfVideo           : String?
    var level               : String?
    var profileType         : String?
    var admin               : String?
    var followers           : String?
    var following           : String?
    var internshipKeywords  : String?
    var confirmationhash    : String?
    var expiration          : String?
    var isConfirmed         : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        name                  <- map["name"]
        email                 <- map["email"]
        password              <- map["password"]
        birthYear             <- map["birthYear"]
        gender                <- map["gender"]
        locationCity          <- map["locationCity"]
        locationState         <- map["locationState"]
        locationCountry       <- map["locationCountry"]
        profilePicture        <- map["profilePicture"]
        resume                <- map["resume"]
        liProfile             <- map["liProfile"]
        fbProfile             <- map["fbProfile"]
        level                 <- map["level"]
        selfVideo             <- map["selfVideo"]
        profileType           <- map["profileType"]
        admin                 <- map["admin"]
        followers             <- map["followers"]
        following             <- map["following"]
        internshipKeywords    <- map["internshipKeywords"]
        confirmationhash      <- map["confirmationhash"]
        expiration            <- map["expiration"]
        isConfirmed           <- map["isConfirmed"]

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
 },*/
}
