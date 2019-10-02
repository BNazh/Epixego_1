//
//  TitlePositionCell.swift
//  Epixego
//
//  Created by Moath Yahia on 9/13/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class TitlePositionCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet private weak var companyTxt            : UITextField!
    @IBOutlet private weak var productAcomplishTxt   : UITextField!
    @IBOutlet private weak var titlePositionTxt      : UITextField!
    @IBOutlet private weak var canBeImproveTxt       : UITextField!
    @IBOutlet private weak var bestPartOfWorkingTxt  : UITextField!
    @IBOutlet private weak var startDateTxt          : UITextField!
    @IBOutlet private weak var endDateTxt            : UITextField!
    @IBOutlet private weak var selectTagTxt          : UITextField!
    @IBOutlet private weak var descriptionTxt        : UITextField!
    @IBOutlet weak var trashBtn                      : UIButton!

    lazy var tempPositionsHeld = PositionsHeldModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        companyTxt.delegate           = self
        productAcomplishTxt.delegate  = self
        titlePositionTxt.delegate     = self
        canBeImproveTxt.delegate      = self
        bestPartOfWorkingTxt.delegate = self
        startDateTxt.delegate         = self
        endDateTxt.delegate           = self
        selectTagTxt.delegate         = self
        descriptionTxt.delegate       = self
    }
    
    func fillData(positionsHeld: PositionsHeldModel) {
        tempPositionsHeld         = positionsHeld
        companyTxt.text           = positionsHeld.companyInstitution
        productAcomplishTxt.text  = positionsHeld.proudestAcomplishments
        titlePositionTxt.text     = positionsHeld.name
        canBeImproveTxt.text      = positionsHeld.canBeImproved
        bestPartOfWorkingTxt.text = positionsHeld.bestPartOfWorking
        startDateTxt.text         = positionsHeld.startDate
        endDateTxt.text           = positionsHeld.endDate
        descriptionTxt.text       = positionsHeld.workDescription
       
        var tags = ""
        for tag in positionsHeld.tags {
            tags = "\(tags), \(tag)"
        }
        selectTagTxt.text         = tags
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
      if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                        with: string)
            
        switch textField.tag {
        case 10:
            tempPositionsHeld.companyInstitution = updatedText
        case 20:
            tempPositionsHeld.proudestAcomplishments = updatedText
        case 30:
            tempPositionsHeld.name = updatedText
        case 40:
            tempPositionsHeld.canBeImproved = updatedText
        case 50:
            tempPositionsHeld.bestPartOfWorking = updatedText
//        case 60://select
//            tempPositionsHeld.tags = updatedText
        case 70:
            tempPositionsHeld.startDate = updatedText
        case 80:
            tempPositionsHeld.endDate = updatedText
        case 90:
            tempPositionsHeld.workDescription = updatedText

        default:
            print("default")
        }
        }
            
        return true
    }
    
}

