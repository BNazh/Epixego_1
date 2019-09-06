//
//  DetailsJobController.swift
//  Epixego
//
//  Created by Moath Yahia on 8/1/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit



class DetailsJobController: UIViewController {

    @IBOutlet fileprivate weak var containerView  : UIView!
    @IBOutlet fileprivate weak var companyName    : UILabel!
    @IBOutlet fileprivate weak var jobTitleLbl    : UILabel!
    @IBOutlet fileprivate weak var locationLbl    : UILabel!
    @IBOutlet fileprivate weak var dateLbl        : UILabel!
    @IBOutlet fileprivate weak var companyLogoImg : UIImageView!
    @IBOutlet fileprivate weak var experienceLbl  : UILabel!
    @IBOutlet fileprivate weak var descriptionLbl : UILabel!
    
    @IBOutlet fileprivate weak var applyBtn       : UIButton!
    @IBOutlet fileprivate weak var saveBtn        : UIButton!
    
    lazy var jobsResultSourceModel = ItemsResultJobsModel()
    lazy var changeStatusModel     = ChangeStatusModel()
    lazy var http = HTTPController()
    var tag: Int?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        http.delegate = self
        fillData()
        setupView()
    }
    
    fileprivate func setupView() {
        CustomDesign.setBackgroundImage(view: self.view)

        CustomDesign.customAnyView(view: containerView, cornerRadius: 8.0, shadowColor: UIColor.darkGray, shadowRadius: 5.0, shadowOpacity: 0.5)

        CustomDesign.customAnyView(view: applyBtn, cornerRadius: 10.0, cornerColor: UIColor.white, cornerWidth: 1.5, shadowColor: UIColor.darkGray, shadowRadius: 5.0, shadowOpacity: 0.7)
        CustomDesign.customAnyView(view: saveBtn, cornerRadius: 10.0, cornerColor: UIColor.white, cornerWidth: 1.5, shadowColor: UIColor.darkGray, shadowRadius: 5.0, shadowOpacity: 0.7)

    }
    
    fileprivate func fillData() {
        companyName.text     = jobsResultSourceModel.source?.generalInfo?.companyInstitution ?? ""
        jobTitleLbl.text     = jobsResultSourceModel.source?.generalInfo?.position ?? ""
        
        let location = "\(jobsResultSourceModel.source?.generalInfo?.locationCity ?? "") \(jobsResultSourceModel.source?.generalInfo?.locationCity ?? "") \(jobsResultSourceModel.source?.generalInfo?.locationCountry ?? "")"
        
        locationLbl.text     = location
        dateLbl.text         = jobsResultSourceModel.source?.generalInfo?.postedDate ?? ""
        descriptionLbl.text  = jobsResultSourceModel.source?.generalInfo?.jobDescription ?? ""
        
        experienceLbl.text   =  jobsResultSourceModel.source?.experience?.level ?? ""
        
//        check if applied or not
        if jobsResultSourceModel.source?.candidates?.first?.flag == "applied" {
            applyBtn.setTitle("applied", for: .normal)
            applyBtn.isUserInteractionEnabled = false
            saveBtn.isUserInteractionEnabled = false
        } else if jobsResultSourceModel.source?.candidates?.first?.flag == "saved" {
            saveBtn.setTitle("saved", for: .normal)
            saveBtn.isUserInteractionEnabled = false
        }
    }
    
    func updateResultApply() {
        
        if changeStatusModel.shareds?.successful == 1 && changeStatusModel.shareds?.failed == 0 && tag == 1 {
            print("applied")
            self.displayAlertSuccess(title: "Applied", message: "Thank you for applying this job")
            applyBtn.setTitle("Applied", for: .normal)
            
        } else if changeStatusModel.shareds?.successful == 1 && changeStatusModel.shareds?.failed == 0 && tag == 2 {
            self.displayAlertSuccess(title: "saved", message: "Thank you for saving this job")
            saveBtn.setTitle("saved", for: .normal)
        }
        saveBtn.isUserInteractionEnabled = false
        applyBtn.isUserInteractionEnabled = false

    }
    
    @IBAction func applyBtn(sender: UIButton) {
        let status = EnumsConstants.JobStatus.applied
        print(status)
        
        let params: [String: String] = ["studentId": UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId),
                                        "state": status.rawValue,
                                        "profiletype": "STUDENT",
                                        "jobId": jobsResultSourceModel.id ?? ""]
        /*
         {
         "studentId": "nCxSRWwBGizRVg2qRDP0",
         "state": "applied",
         "profiletype": "STUDENT",
         "jobId": "7CzpSGwBGizRVg2qakUn"
         }
         */
        tag = 1
        http.put(path: APIConstants.baseURl + APIConstants.changeStatusURL , parameter: params, tag: tag ?? 0)
    }
    
    @IBAction func saveBtn(sender: UIButton) {
        let status = EnumsConstants.JobStatus.saved

        let params: [String: String] = ["studentId": UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId),
                                        "state": status.rawValue,
                                        "profiletype": "STUDENT",
                                        "jobId": jobsResultSourceModel.id ?? ""]
        tag = 2
        http.put(path: APIConstants.baseURl + APIConstants.changeStatusURL, parameter: params, tag: tag ?? 0)
    }
}
