//
//  ContactUsModel.swift
//  Epixego
//
//  Created by Moath Yahia on 9/5/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class ContactUsModel: Mappable {
  
    var message    : String?
    var success    : Bool?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        message    <- map["message"]
        success    <- map["success"]
    }
}
