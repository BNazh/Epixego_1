//
//  DetailsPeopleDataSourceController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/25/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

extension DetailsPeopleController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExperienceDetailsCell
        
        cell.firstExperienceLbl.text = "Experience Experience Experience Experience Experience Experience Experience Experience Experience Experience Experience Experience Experience"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "profissonal experience"
        } else {
            return "\(section)"
        }
    }
    
}
