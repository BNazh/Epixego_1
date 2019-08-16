//
//  EnumsConstants.swift
//  Epixego
//
//  Created by Moath Yahia on 7/16/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation


class EnumsConstants {
    
    static var shared = EnumsConstants()
    
    enum enumLevel: String {
        case HighSchool = "hs"
        case College = "col"
        case GraduateSchool = "gs"
        case EarlyProfessional = "ep"
        case AdvancedProfessional = "ap"
    }
    
    enum JobStatus: String {
        case applied
        case contacted
        case saved
        case rejected
    }
}
