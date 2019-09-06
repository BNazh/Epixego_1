//
//  LandingEmployerController.swift
//  Epixego
//
//  Created by Moath Yahia on 8/8/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class LandingEmployerController: UIViewController {

    @IBOutlet fileprivate weak var containSearchView  : UIView!
    @IBOutlet fileprivate weak var peopleTxt          : UITextField!
    
    lazy var resutlPeopleSearchModel = ResultSearchPeopleModel()
    lazy var http = HTTPController()
    var nameText = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        peopleTxt.text = "John"
    }
    
    fileprivate func setupView() {
        
        http.delegate = self
        CustomDesign.setBackgroundImage(view: self.view)
        
        CustomDesign.customAnyView(view: containSearchView, cornerRadius: 5.0, cornerColor: UIColor.white, cornerWidth: 1.0, shadowColor: nil, shadowRadius: nil, shadowOpacity: nil)
    }
    
    @IBAction fileprivate func backBtn(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction fileprivate func peopleBtn(sender: UIButton) {
        guard let nameOfPeople = peopleTxt.text else {
            return
        }
        nameText = nameOfPeople
        http.get(path: "\(APIConstants.baseURl + APIConstants.searchPeopleURL)\(nameText)", parameter: [:], tag: 1)
    }
    
    func goToInfoSearchPoeple() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: ConstantControllers.resultSearchPeopleController) as! ResultSearchPeopleController
   
        resutlPeopleSearchModel.namePeople = nameText
        controller.resutlPeopleSearchModel = resutlPeopleSearchModel
        
        let navigation = UINavigationController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
