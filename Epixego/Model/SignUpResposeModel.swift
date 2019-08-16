//
//  SignUpResposeModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/15/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class SignUpResposeModel: Mappable {
    
    var email     : String?
    var userId    : String?
    var token     : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        email     <- map["email"]
        userId    <- map["id"]
        token     <- map["token"]
    }
}
