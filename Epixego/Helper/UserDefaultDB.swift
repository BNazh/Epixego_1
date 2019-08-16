//
//  UserDefaultDB.swift
//  Epixego
//
//  Created by Moath Yahia on 7/12/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit

struct UserDefaultDB {
    
    static var shared = UserDefaultDB()
    
    func addUserDefaultString(value: String, key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    func getUserDefaultString(key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    func removeUserDefaultString(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
}
