//
//  ActivitiesCell.swift
//  Epixego
//
//  Created by Moath Yahia on 9/13/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ActivitiesCell: UITableViewCell {

    @IBOutlet weak var titleLbl           : UILabel!
    @IBOutlet private weak var itemTxt    : UITextField!
    @IBOutlet private weak var tagTxt     : UITextField!
    @IBOutlet weak var trashBtn           : UIButton!
    
    lazy var tempActivity         = TagsNameModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTxt.delegate  = self
        tagTxt.delegate   = self

    }

    func fillData(data: TagsNameModel) {
        tempActivity   = data
        
        itemTxt.text   = data.name ?? ""
        
        var tags = ""
        for tag in data.tags ?? [] {
            tags = "\(tags) \(tag)"
        }
        tagTxt.text    =  tags
    }
}

extension ActivitiesCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
                                      
            switch textField.tag {
                case 10:
                    tempActivity.name = updatedText
//                case 20: // select tag
//                    tempActivity.tags = updatedText
              
                default:
                    print("default")
            }
        }
        return true
    }
}
