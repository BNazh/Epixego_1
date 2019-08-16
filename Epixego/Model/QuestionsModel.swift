//
//  QuestionsModel.swift
//  Epixego
//
//  Created by Moath Yahia on 7/29/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

struct QuestionsModel {
    var title         : String?
    var description   : String?
    var expanded      : Bool
    
    init(title: String, description: String, expanded: Bool) {
        self.title        = title
        self.description  = description
        self.expanded     = expanded
    }
}
