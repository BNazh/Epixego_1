//
//  SuccessAlertVC.swift
//  AlertView
//
//  Created by moath yahya on 10/8/17.
//  Copyright © 2017 moath yahya. All rights reserved.
//

import UIKit

class SuccessAlertVC: CPAlertVC {

    //MARK: - DECLARE
    @IBOutlet weak var imageView: UIImageView!
    
    var imgLogo: UIImage?
    
    //MARK: - CONFIG
    
    override class func create() -> SuccessAlertVC {
        let alertStoryboard = UIStoryboard(name: "CPAlert", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "SuccessAlertID") as! SuccessAlertVC
        return alertVC
    }
    
    func showCheckImage(_ isCheck: Bool){
        imgLogo = (isCheck) ? UIImage.init(named: "success-icon") : UIImage.init(named: "")
    }
    
    /// Custom your UI in here
    override func configUI() {
        super.configUI()
        self.imageView.image = imgLogo
    }
}
