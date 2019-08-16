//
//  QuestionsLandingDelegate.swift
//  Epixego
//
//  Created by Moath Yahia on 7/26/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit

extension QuestionsLandingController: UITableViewDelegate, ExpandableHeaderViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if questionModel[indexPath.section].expanded {
            return UITableView.automaticDimension
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 7
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: questionModel[section].title ?? "", section: section, delegate: self)
        
        return header
    }
 
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        questionModel[section].expanded = !questionModel[section].expanded
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
        tableView.endUpdates()
    }
}
