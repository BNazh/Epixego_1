//
//  DelegateGradSchool.swift
//  Epixego
//
//  Created by Moath Yahia on 9/29/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit

extension GradSchoolController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableview.deselectRow(at: indexPath, animated: true)
    }
}
