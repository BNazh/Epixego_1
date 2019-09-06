//
//  PeopleContainerController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/8/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class PeopleContainerController: UIViewController {

    @IBOutlet fileprivate weak var namePeopleView: UIView!
    @IBOutlet fileprivate weak var namePeopleTxt: UITextField!

    lazy var resutlPeopleSearchModel = ResultSearchPeopleModel()
    var http = HTTPController()
    var nameText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        http.delegate = self
        setupView()
        
        namePeopleTxt.text = "john"

    }
    
    func setupView() {
        namePeopleView.layer.cornerRadius = 5.0
        namePeopleView.layer.borderColor = UIColor.white.cgColor
        namePeopleView.layer.borderWidth = 1.0
        namePeopleView.layer.masksToBounds = true
    }
    
    @IBAction func searchPeopleBtn(sender: UIButton) {
        
        guard let nameOfPeople = namePeopleTxt.text else {
            return
        }
        nameText = nameOfPeople
        
        let param: [String: String] = ["pplType": "roleModel", "keyword": nameText, "userId": UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId)]

        http.post(path: "\(APIConstants.baseURl + APIConstants.findPeopleURL)", parameter: param, tag: 1)        
    }
    
    func goToResultPeopleController() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.resultSearchPeopleController) as! ResultSearchPeopleController
        
        resutlPeopleSearchModel.namePeople = nameText
        controller.resutlPeopleSearchModel = resutlPeopleSearchModel
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
