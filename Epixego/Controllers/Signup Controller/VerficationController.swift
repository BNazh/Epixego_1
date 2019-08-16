//
//  VerficationController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/16/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class VerficationController: UIViewController {

    @IBOutlet fileprivate weak var containView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        CustomDesign.customDesignView(view: containView)
        CustomDesign.setBackgroundImage(view: self.view)
    }
    
    @IBAction func goToLoginBtn(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.loginVC)
        
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}
