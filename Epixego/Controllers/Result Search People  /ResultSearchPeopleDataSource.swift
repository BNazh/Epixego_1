//
//  ResultSearchPeopleDataSource.swift
//  Epixego
//
//  Created by Moath Yahia on 7/22/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


extension ResultSearchPeopleController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemResultPeopleModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ResultSearchPeopleCell
        
        cell.nameLbl.text     = itemResultPeopleModel[indexPath.row].source?.generalInfo?.name ?? ""
        let level             = itemResultPeopleModel[indexPath.row].source?.generalInfo?.level ?? ""
        
        let profileImg = itemResultPeopleModel[indexPath.row].source?.generalInfo?.profilePicture ?? ""
        
        let fullStr = APIConstants.baseURl + APIConstants.uploadURL + profileImg
        print(fullStr)
        cell.profileImg?.sd_setImage(with: URL(string: fullStr), placeholderImage: UIImage.init(named: "avatarBlack-icon"), options: .continueInBackground, completed: nil)
        
        var levelStr = ""
        switch level {
        case "hs", "col":
            levelStr = "Student"
        case "gs":
            levelStr = "Graduate School"
        case "ep":
            levelStr = "Early Professional"
        case "ap":
            levelStr = "Advanced Professional"
        default:
            print("default")
        }
        
        cell.jobTitleLbl.text  = levelStr
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        guard itemResultPeopleModel.count < totalItems else {
            return
        }
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchData  {
                refillData()
            }
        }
    }
}
