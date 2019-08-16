//
//  IkigaiInfoModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/12/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class IkigaiInfoModel: Mappable {
    
    var selfDescribe       : String?
    var othersDescribe     : String?
    var comesEasy          : String?
    var favoriteActivity   : String?
    var aspireTo           : String?
    var improveWorld       : String?
    var successfulPerson   : String?
    var whatMakesSuccess   : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        selfDescribe          <- map["selfDescribe"]
        othersDescribe        <- map["othersDescribe"]
        comesEasy             <- map["comesEasy"]
        favoriteActivity      <- map["favoriteActivity"]
        aspireTo              <- map["aspireTo"]
        improveWorld          <- map["improveWorld"]
        successfulPerson      <- map["successfulPerson"]
        whatMakesSuccess      <- map["whatMakesSuccess"]
    }
}
