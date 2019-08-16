//
//  QuestionsLandingDataSource.swift
//  Epixego
//
//  Created by Moath Yahia on 7/26/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit

extension QuestionsLandingController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return questionModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! QuestionsCell
        
        cell.textLbl.text = questionModel[indexPath.section].description ?? ""
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return questionModel[section].title
//    }
}
