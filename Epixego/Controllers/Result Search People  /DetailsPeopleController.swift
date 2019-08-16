//
//  DetailsPeopleController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/24/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class DetailsPeopleController: UIViewController {

    @IBOutlet fileprivate weak var nameLbl       : UILabel!
    @IBOutlet fileprivate weak var jobTitleLbl   : UILabel!
    @IBOutlet fileprivate weak var profileImg    : UIImageView!
    @IBOutlet fileprivate weak var skillsView    : SkillsChartView!
    @IBOutlet  weak var tableView                : UITableView!

    var itemPeopleModel = ItemsSearchPeopleModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        CustomDesign.setBackgroundImage(view: self.view)
       
        let nib = UINib(nibName: "ExperienceDetailsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        tableView.estimatedRowHeight = 50
    }
}
