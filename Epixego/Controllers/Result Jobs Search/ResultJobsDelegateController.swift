//
//  ResultJobsDelegateController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

extension ResultJobSearchController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.detailsJobController) as! DetailsJobController
        controller.jobsResultSourceModel = itemsResultJobModel[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
