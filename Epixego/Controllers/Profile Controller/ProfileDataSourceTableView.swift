//
//  ProfileDataSourceTableView.swift
//  Epixego
//
//  Created by Moath Yahia on 7/19/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit


extension ProfileUserController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ProfileTableViewCell
        
        cell?.titleLbl.text = "About me"
        cell?.bodyLbl.text  = " About me About me About me About me About me About me About me About me About me About me About me About me About me About me About me"
        
        return cell!
    }
    
    
    
}
