//
//  ProfileModel.swift
//  Epixego
//
//  Created by Moath Yahia on 9/18/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class ProfileModel: Mappable {
    
    var userId                    : String?
    var token                     : String?
    var generalInfo               : GeneralInfoModel?
    var ikigaiInfo                : IkigaiInfoModel?
    var highschoolInfo            : HighschoolInfoModel?
    var collegeInfo               : SchoolInfoModel?
    var graduateInfo              : SchoolInfoModel?
    var earlyProfessionalInfo     : ProfessionalExperienceInfoModel?
    var advancedProfessionalInfo  : ProfessionalExperienceInfoModel?
    var jobs                      : [JobsModel]?
    var genomeInfo                : GenomeModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func  mapping(map: Map) {
        userId                   <- map["id"]
        token                    <- map["token"]
        generalInfo              <- map["generalInfo"]
        ikigaiInfo               <- map["ikigaiInfo"]
        highschoolInfo           <- map["highschoolInfo"]
        collegeInfo              <- map["collegeInfo"]
        graduateInfo             <- map["graduateInfo"]
        earlyProfessionalInfo    <- map["earlyProfessionalInfo"]
        advancedProfessionalInfo <- map["advancedProfessionalInfo"]
        jobs                     <- map["jobs"]
        genomeInfo               <- map["genome"]
    }
}
