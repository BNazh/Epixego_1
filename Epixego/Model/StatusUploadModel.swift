//
//  StatusUploadModel.swift
//  Epixego
//
//  Created by Moath Yahia on 8/28/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class StatusUploadModel: Mappable {
    
    var filename      : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        filename     <- map["filename"]
    }
}
