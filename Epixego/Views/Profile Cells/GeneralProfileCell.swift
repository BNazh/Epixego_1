//
//  GeneralProfileCell.swift
//  Epixego
//
//  Created by Moath Yahia on 9/13/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class GeneralProfileCell: UITableViewCell {

    @IBOutlet private weak var titleStaticLbl  : UILabel!
    @IBOutlet private weak var itemTxt         : UITextField!
    @IBOutlet weak var trashBtn                : UIButton!
    
    lazy var tempData                  = ProfessionalExperienceInfoModel()
    lazy var dataStr                   = String()
    
    var row = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTxt.delegate = self
    }

    func fillDataProudestAcomplishment(data: String?, title: String) {
        row = 4
        dataStr             = data ?? ""
        
        titleStaticLbl.text = title
        itemTxt.text        = data ?? ""
    }
    
    func fillData(row: Int,data: ProfessionalExperienceInfoModel) {
        tempData = data
        self.row = row
        switch row {
        case 0:
            titleStaticLbl.text = "Best part of working"
            itemTxt.text        = data.bestPartOfWorking ?? ""
        case 1:
            titleStaticLbl.text = "Things that can be better"
            itemTxt.text        = data.canBeImproved ?? ""
        case 2:
            titleStaticLbl.text = "Aspirational Role in next 10 years"
            itemTxt.text        = data.aspirationalRole ?? ""
        case 3:
            titleStaticLbl.text = "Advice Younger Self"
            itemTxt.text        = data.adviceToSelf ?? ""

        default:
            print("default")
        }
    }
}

extension GeneralProfileCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)

            switch row {
            case 0:
                tempData.bestPartOfWorking  = updatedText
            case 1:
                tempData.canBeImproved      = updatedText
            case 2:
                tempData.aspirationalRole   = updatedText
            case 3:
                tempData.adviceToSelf       = updatedText
            case 4:
                dataStr = updatedText
            default: /*Proudest Acomplishment*/
                print("defaultit")
            }
            }
        
        return true
    }
}
