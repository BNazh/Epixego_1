//
//  LoginModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/11/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginModel: Mappable {
    
    var userId     : String?
    var token      : String?
    var type       : String?
    var source     : SourceModel?
    /*
     "_source": {
     "generalInfo": {
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
    required convenience init?(map: Map) {
       self.init()
    }

    func  mapping(map: Map) {
        userId      <- map["_id"]
        token       <- map["token"]
        type        <- map["type"]
        source      <- map["_source"]
    }
}
