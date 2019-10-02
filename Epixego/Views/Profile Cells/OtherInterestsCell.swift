//
//  OtherInterestsCell.swift
//  Epixego
//
//  Created by Moath Yahia on 9/13/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class OtherInterestsCell: UITableViewCell {

    @IBOutlet private weak var itemTxt            : UITextField!
    @IBOutlet private weak var titlePositionTxt   : UITextField!
    @IBOutlet private weak var timeCommitmentTxt  : UITextField!
    @IBOutlet private weak var durationTxt        : UITextField!
    @IBOutlet private weak var tagsTxt            : UITextField!
    @IBOutlet weak var trashBtn                   : UIButton!
    
    lazy var tempPositionInfo             = PositionInformationModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTxt.delegate           = self
        titlePositionTxt.delegate  = self
        timeCommitmentTxt.delegate = self
        durationTxt.delegate       = self
        tagsTxt.delegate           = self
    }

    func fillData(data: PositionInformationModel) {
        tempPositionInfo         = data
        itemTxt.text             = data.name ?? ""
        titlePositionTxt.text    = data.titlePosition ?? ""
        durationTxt.text         = data.duration ?? ""
        timeCommitmentTxt.text   = data.timeCommitment ?? ""
        
        var tags = ""
        
        for tag in data.tags ?? [] {
            tags += tag
        }
        tagsTxt.text             = tags
    }
}

extension OtherInterestsCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
                                 
           switch textField.tag {
                case 10:
                    tempPositionInfo.name = updatedText
                case 20:
                    tempPositionInfo.titlePosition = updatedText
                case 30:
                    tempPositionInfo.duration = updatedText
                case 40:
                    tempPositionInfo.timeCommitment = updatedText
        //       case 50: select tag
        //           tempClubModel = updatedText
                        default:
                            print("default")
                    }
        }
                                 
        return true
    }
}
