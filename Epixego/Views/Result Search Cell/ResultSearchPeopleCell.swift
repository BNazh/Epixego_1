//
//  ResultSearchPeopleCell.swift
//  Epixego
//
//  Created by Moath Yahia on 7/22/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ResultSearchPeopleCell: UITableViewCell {

    @IBOutlet weak var containDataView : UIView!
    @IBOutlet weak var profileImg      : UIImageView!
    @IBOutlet weak var nameLbl         : UILabel!
    @IBOutlet weak var jobTitleLbl     : UILabel!

    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        containDataView.layer.cornerRadius = 8.0
        containDataView.layer.shadowColor = UIColor.darkGray.cgColor
        containDataView.layer.shadowOpacity = 1.0
        containDataView.layer.shadowOffset = .zero
        containDataView.layer.shadowRadius = 1.0
        
    }

}
