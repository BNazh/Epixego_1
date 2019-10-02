//
//  ProfileTableViewCell.swift
//  Epixego
//
//  Created by Moath Yahia on 7/19/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containView : UIView!
    @IBOutlet weak var titleLbl    : UILabel!
    @IBOutlet weak var bodyLbl     : UILabel!
    
    @IBOutlet weak var editBtn     : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        CustomDesign.customDesignView(view: containView)
    }

    
}
