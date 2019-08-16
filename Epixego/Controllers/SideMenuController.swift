//
//  SideMenuController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/9/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class SideMenuController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataArray = ["Search Internships", "Role Models", "Blog", "Login", "SIGN UP"]
        
        let nib = UINib(nibName: "SideMenuCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        
    }
    
    
    func goToController(contr: String) {

        let controller = self.storyboard?.instantiateViewController(withIdentifier: contr) 
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}

extension SideMenuController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as? SideMenuCell
        
        cell?.nameLbl.text = dataArray[indexPath.row]
        
        
        return cell!

    }
}

extension SideMenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("Internship")
        case 1:
            print("Role")
        case 2:
            print("blog")
        case 3:
            print("Login")
            
            goToController(contr: ConstantControllers.loginVC)
        case 4:
            print("sign up")
            goToController(contr: ConstantControllers.signUpVC)
        default:
            print("default")
        }
    }
}

