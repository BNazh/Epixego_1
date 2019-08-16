//
//  ResultSearchJobsCell.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ResultSearchJobsCell: UITableViewCell {

    @IBOutlet fileprivate weak var containerView    : UIView!
    @IBOutlet fileprivate weak var logoImg          : UIImageView!
    @IBOutlet fileprivate weak var JobTitleLbl      : UILabel!
    @IBOutlet fileprivate weak var locationLbl      : UILabel!
    @IBOutlet fileprivate weak var timeLbl          : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

    func setupView() {
        containerView.layer.cornerRadius = 8.0
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowOpacity = 1.5
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 1.0
    }
    
    func setData(data: GeneralInfoResultJobsModel) {
        JobTitleLbl.text = data.position ?? ""
        
        let location = "\(data.locationCity ?? "") \(data.locationState ?? "") \(data.locationCountry ?? "")"
        
        locationLbl.text = location
        timeLbl.text     = data.postedDate ?? ""
        
    }
}
