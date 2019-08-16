//
//  FailedAlertVC.swift
//  AlertView
//
//  Created by moath yahya on 10/8/17.
//  Copyright © 2017 moath yahya. All rights reserved.
//

import UIKit

class FailedAlertVC: CPAlertVC {
    
    //MARK: - DECLARE
    @IBOutlet weak var imageView: UIImageView!
    
    var imgLogo: UIImage?
    
    //MARK: - CONFIG
    override class func create() -> FailedAlertVC {
        
        let alertStoryboard = UIStoryboard(name: "CPAlert", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "FailedAlertID") as! FailedAlertVC
        return alertVC
    }
    
    func showCheckImage(_ isCheck: Bool) {
        imgLogo = (isCheck) ? #imageLiteral(resourceName: "failed-icon") : #imageLiteral(resourceName: "ic_music")
    }
    
    override func configUI() {
        super.configUI()
        self.imageView.image = imgLogo
    }
}
