//
//  ExperienceController.swift
//  Epixego
//
//  Created by Moath Yahia on 9/13/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ExperienceController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
 
    var professionalInfoModel = ProfessionalExperienceInfoModel()
    lazy var http = HTTPController()
    
    lazy var dicProfessionalInfo        = Dictionary<Int, TitlePositionCell>()
    lazy var dicClubOrganiztion         = Dictionary<Int, ClubOrganizationCell>()
    lazy var dicOtherInterests          = Dictionary<Int, OtherInterestsCell>()
    lazy var dicActivities              = Dictionary<Int, ActivitiesCell>()
    lazy var dicProudestAcomplishments  = Dictionary<Int, GeneralProfileCell>()
//    lazy var dicGeneralInfo             = Dictionary<Int, GeneralProfileCell>()

    lazy var responseModel              = ResponsePartialProfileModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        http.delegate = self
        
    }
    
    private func setupView() {
        let titlePositionNib = UINib(nibName: "TitlePositionCell", bundle: nil)
        tableView.register(titlePositionNib, forCellReuseIdentifier: "titlePositionCell")
        
        let clubOrganizationNib = UINib(nibName: "ClubOrganizationCell", bundle: nil)
        tableView.register(clubOrganizationNib, forCellReuseIdentifier: "clubOrganizationCell")
        
        let otherInterestsCell = UINib(nibName: "OtherInterestsCell", bundle: nil)
        tableView.register(otherInterestsCell, forCellReuseIdentifier: "otherInterestsCell")
        
        let activitiesCell = UINib(nibName: "ActivitiesCell", bundle: nil)
        tableView.register(activitiesCell, forCellReuseIdentifier: "activitiesCell")
        
        let generalProfileCell = UINib(nibName: "GeneralProfileCell", bundle: nil)
        tableView.register(generalProfileCell, forCellReuseIdentifier: "generalProfileCell")
        
        let addFieldCell = UINib(nibName: "AddFieldCell", bundle: nil)
        tableView.register(addFieldCell, forCellReuseIdentifier: "addFieldCell")
    }
    
    @IBAction private func saveBtn(sender: UIBarButtonItem) {
        
        for (key, value) in dicProfessionalInfo {
            professionalInfoModel.positionsHeld?[key] = value.tempPositionsHeld
        }
        
        for (key, value) in dicClubOrganiztion {
            professionalInfoModel.clubsOrgs?[key] = value.tempClubModel
        }
        
        for (key, value) in dicOtherInterests {
            professionalInfoModel.otherInterests?[key] = value.tempPositionInfo
        }

        for (key, value) in dicActivities {
            professionalInfoModel.impactfulActivities?[key] = value.tempActivity
        }
        
        for (key, value) in dicProudestAcomplishments {
            professionalInfoModel.proudestAcomplishments?[key] = value.dataStr
        }
        
        let param: [String: Any] = ["userId": UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId),
                     "type": "STUDENT",
                     "data": ["professionalInfo": professionalInfoModel.toJSON()]
            ] as [String : Any]
        
        http.post(path: APIConstants.baseURl + APIConstants.partialUpdateURL, parameter: param, tag: 1)

    }

    @IBAction private func cancelBtn(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showMessage() {
        if responseModel.shareds?.successful == 1 { // 1 = true

            self.displayAlertViewActions(title: "Done", message: "Updated successfully", actions: [CPAlertAction.init(title: "Done", type: .normal, handler: {

                self.dismiss(animated: true, completion: nil)
            })])
        }
    }

}
