//
//  DetailsPeopleDelegateController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/25/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

extension DetailsPeopleController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
}
