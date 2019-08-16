//
//  ExperienceDetailsCell.swift
//  Epixego
//
//  Created by Moath Yahia on 7/25/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ExperienceDetailsCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var firstContainView   : UIView!
    @IBOutlet fileprivate weak var secondContainView  : UIView!
    @IBOutlet fileprivate weak var thirdContainView   : UIView!
    @IBOutlet fileprivate weak var fourthContainView  : UIView!

    @IBOutlet weak var firstExperienceLbl             : UILabel!
    @IBOutlet weak var secondExperienceLbl            : UILabel!
    @IBOutlet weak var thirdExperienceLbl             : UILabel!
    @IBOutlet weak var fourthExperienceLbl            : UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        
        designView(view: firstContainView)
        designView(view: secondContainView)
        designView(view: thirdContainView)
        designView(view: fourthContainView)
    }

    
    func designView(view: UIView) {
        
        view.layer.cornerRadius = 6.0
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.masksToBounds = true
    }
    
    
}
