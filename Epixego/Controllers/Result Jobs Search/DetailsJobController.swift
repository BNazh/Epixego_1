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
    lazy var http = HTTPController()
   
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
    }
    
    @IBAction func saveBtn(sender: UIButton) {
        let status = EnumsConstants.JobStatus.saved

        let params: [String: String] = ["studentId": UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId),
                                        "state": status.rawValue,
                                        "profiletype": "STUDENT",
                                        "jobId": jobsResultSourceModel.id ?? ""]
    }
}
