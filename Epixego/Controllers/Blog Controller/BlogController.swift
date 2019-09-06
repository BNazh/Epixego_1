//
//  BlogController.swift
//  Epixego
//
//  Created by Moath Yahia on 9/4/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class BlogController: UIViewController {

    @IBOutlet private weak var blogTxt: UITextField!
    @IBOutlet private weak var blogBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        CustomDesign.setBackgroundImage(view: self.view)
        
        CustomDesign.customAnyView(view: blogTxt, cornerRadius: 6.0, cornerColor: UIColor.white, cornerWidth: 1.0)
        CustomDesign.customAnyView(view: blogBtn, cornerRadius: 6.0)
        
    }
    
    @IBAction func blogBtn(sender: UIButton) {
        
    }

}
