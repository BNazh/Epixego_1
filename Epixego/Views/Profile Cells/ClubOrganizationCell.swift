//
//  ClubOrganizationCell.swift
//  Epixego
//
//  Created by Moath Yahia on 9/13/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ClubOrganizationCell: UITableViewCell {

    @IBOutlet private weak var clubTxt                 : UITextField!
    @IBOutlet private weak var titlePositionTxt        : UITextField!
    @IBOutlet private weak var selectTimeCommitmentTxt : UITextField!
    @IBOutlet private weak var selectDurationTxt       : UITextField!
    @IBOutlet private weak var selectTagsTxt           : UITextField!
    @IBOutlet private weak var descriptionTxt          : UITextField!
    @IBOutlet weak var trashBtn                        : UIButton!

    lazy var tempClubModel = PositionInformationModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        clubTxt.delegate                 = self
        titlePositionTxt.delegate        = self
        selectTimeCommitmentTxt.delegate = self
        selectDurationTxt.delegate       = self
        selectTagsTxt.delegate           = self
        descriptionTxt.delegate          = self
    }

    func fillData(clubOrganization: PositionInformationModel) {
        tempClubModel                = clubOrganization
        clubTxt.text                 = clubOrganization.name
        titlePositionTxt.text        = clubOrganization.titlePosition
        selectTimeCommitmentTxt.text = clubOrganization.timeCommitment
        selectDurationTxt.text       = clubOrganization.duration
        
        var tags = ""
        for tag in clubOrganization.tags ?? [] {
            tags = "\(tags), \(tag)"
        }
        selectTagsTxt.text         = tags
        descriptionTxt.text        = ""
    }
}


extension ClubOrganizationCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
                         
           switch textField.tag {
                case 10:
                    tempClubModel.name = updatedText
                case 20:
                    tempClubModel.titlePosition = updatedText
                case 30:
                    tempClubModel.timeCommitment = updatedText
                case 40:
                    tempClubModel.duration = updatedText
//                case 50: select tag
//                    tempClubModel = updatedText
                default:
                    print("default")
            }
        }
                         
        return true
    }
}
