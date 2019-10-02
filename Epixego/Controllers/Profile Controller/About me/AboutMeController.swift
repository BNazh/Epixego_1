//
//  AboutMeController.swift
//  Epixego
//
//  Created by Moath Yahia on 9/11/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class AboutMeController: UIViewController {

    @IBOutlet private weak var firstTxt    : UITextField!
    @IBOutlet private weak var secondTxt   : UITextField!
    @IBOutlet private weak var thirdTxt    : UITextField!
    @IBOutlet private weak var forthTxt    : UITextField!
    @IBOutlet private weak var fivthTxt    : UITextField!
    @IBOutlet private weak var sixthTxt    : UITextField!
    @IBOutlet private weak var seventhTxt  : UITextField!
    @IBOutlet private weak var eighthTxt   : UITextField!
    
    @IBOutlet private weak var cancelBtn   : UIButton!
    @IBOutlet private weak var saveBtn     : UIButton!

    var http = HTTPController()
    
    var infoModel = IkigaiInfoModel()
    lazy var responseModel = ResponsePartialProfileModel()

    var aboutmeDelegate: AboutMeProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        http.delegate = self

        fillData()
        setupView()
    }
    
    func fillData() {
        self.title       = "About me"
        firstTxt.text    = infoModel.selfDescribe ?? ""
        secondTxt.text   = infoModel.othersDescribe ?? ""
        thirdTxt.text    = infoModel.comesEasy ?? ""
        forthTxt.text    = infoModel.favoriteActivity ?? ""
        fivthTxt.text    = infoModel.aspireTo ?? ""
        sixthTxt.text    = infoModel.improveWorld ?? ""
        seventhTxt.text  = infoModel.successfulPerson ?? ""
        eighthTxt.text   = infoModel.whatMakesSuccess ?? ""
    }
    
    private func setupView() {
        CustomDesign.customAnyView(view: cancelBtn, cornerRadius: 6 ,cornerColor: UIColor.white ,cornerWidth: 0, shadowColor: UIColor.darkGray, shadowRadius: 2, shadowOpacity: 1)
        CustomDesign.customAnyView(view: saveBtn, cornerRadius: 6 ,cornerColor: UIColor.white ,cornerWidth: 0, shadowColor: UIColor.darkGray, shadowRadius: 2, shadowOpacity: 1)
    }
    
    @IBAction private func cancelBtn(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func saveBtn(sender: UIButton) {
        
        let dataDic = ["selfDescribe": firstTxt.text ?? "",
                       "othersDescribe": secondTxt.text ?? "",
                       "comesEasy": thirdTxt.text ?? "",
                       "favoriteActivity": forthTxt.text ?? "",
                       "aspireTo": fivthTxt.text ?? "",
                       "improveWorld": sixthTxt.text ?? "",
                       "successfulPerson": seventhTxt.text ?? "",
                       "whatMakesSuccess": eighthTxt.text ?? ""]
        
        let param: [String: Any] = ["userId": UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId),
                     "type": "STUDENT",
                     "data": ["ikigaiInfo": dataDic]
            ] as [String : Any]
        
        http.post(path: APIConstants.baseURl + APIConstants.partialUpdateURL, parameter: param, tag: 1)
    }
    
    func showMessage() {
        if responseModel.shareds?.successful == 1 { // 1 > true

            self.displayAlertViewActions(title: "Done", message: "Updated successfully", actions: [CPAlertAction.init(title: "Done", type: .normal, handler: {
                self.aboutmeDelegate?.reloadDataFromAPi()
                self.dismiss(animated: true, completion: nil)
                
            })])
            
        }
    }
}
