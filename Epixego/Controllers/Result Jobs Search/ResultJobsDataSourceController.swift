//
//  ResultJobsDataSourceController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

extension ResultJobSearchController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsResultJobModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ResultSearchJobsCell
        
        var  generalInfo = GeneralInfoResultJobsModel()
        generalInfo = (itemsResultJobModel[indexPath.row].source!.generalInfo)!
        cell.setData(data: generalInfo)
        
        print("index path>>>>\(indexPath.row)")

        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        guard itemsResultJobModel.count < totalItems else {
            return
        }
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchData  {
                reFillData()
            }
        }
    }
}
