//
//  ResultSearchPeopleDelegate.swift
//  Epixego
//
//  Created by Moath Yahia on 7/22/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit

extension ResultSearchPeopleController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.detailsPeopleController) as! DetailsPeopleController
        
        controller.itemPeopleModel = (resutlPeopleSearchModel.items?[indexPath.row])!
        self.navigationController?.pushViewController(controller, animated: true)
    }
 
    
}
