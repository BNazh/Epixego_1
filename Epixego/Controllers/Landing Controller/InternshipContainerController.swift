//
//  InternshipContainerController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/8/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class InternshipContainerController: UIViewController {

    
    @IBOutlet fileprivate weak var keyboardTxt: UITextField!
    @IBOutlet fileprivate weak var locationTxt: UITextField!
    
    lazy var http = HTTPController()
    lazy var resultJobsModel = ResultJobsModel()
    
    var keyWordStr = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        http.delegate = self
        keyboardTxt.text = "math"
    }
    
    
    @IBAction func searchInternshipBtn(sender: UIButton) {
        print("Search internship")
        
        guard let keywordValue = keyboardTxt.text else {
            return
        }
        keyWordStr = keywordValue
        let path = keyWordStr + "&size=" + "\(10)" + "&page=" + "\(1)"

        let fullUrl: String = "\(APIConstants.baseURl)\(APIConstants.searchInternshipURL)\(path)"
        http.get(path: fullUrl, parameter: [:], tag: 1)
    }
    
    func goToResultDetailsController() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.resultJobSearchController) as! ResultJobSearchController
        controller.resultJobsModel = resultJobsModel
        controller.keywordValue = keyWordStr
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
