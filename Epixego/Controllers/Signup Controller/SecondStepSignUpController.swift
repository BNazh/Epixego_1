//
//  SecondStepSignUpController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/11/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import SwiftValidator
import Foundation
import iOSDropDown
import SideMenu
import MobileCoreServices

class SecondStepSignUpController: UIViewController {

    @IBOutlet fileprivate weak var containerDataView  : UIView!

    
    @IBOutlet fileprivate weak var firstNameTxt  : UITextField!
    @IBOutlet fileprivate weak var lastNameTxt   : UITextField!
    @IBOutlet fileprivate weak var locationTxt   : UITextField!
    @IBOutlet fileprivate weak var levelTxt      : DropDown!
    @IBOutlet fileprivate weak var submitBtn     : UIButton!
    @IBOutlet weak var profilePicLbl : UILabel!
    @IBOutlet fileprivate weak var resumeLbl     : UILabel!
    
    @IBOutlet fileprivate weak var firstNameErrorLbl : UILabel!

    @IBOutlet fileprivate weak var locationErrorLbl  : UILabel!
    @IBOutlet fileprivate weak var levelErrorLbl     : UILabel!
    
    lazy var validator = Validator()
    lazy var levelArray = [String]()
    
    var sourceModel = SourceModel()
    var generalInformation = GeneralInfoModel()
    lazy var signUpResposeModel = SignUpResposeModel()
    lazy var statusUploadModel = StatusUploadModel()
    
    var levelEnum = EnumsConstants.enumLevel.HighSchool

    lazy var http = HTTPController()
    var imageProfileString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        setupDropDownList()
        http.delegate = self
        
        firstNameTxt.text = "Moath"
        lastNameTxt.text = "yahia"
        locationTxt.text = "san jose / US"
    }
    
    func setupView() {
        CustomDesign.customDesignView(view: containerDataView)
        CustomDesign.setBackgroundImage(view: self.view)
        validation()
    }

    func setupDropDownList() {
        levelArray = ["High School", "College", "Granduate School", "Early Prfessional(<7yrs exp)", "advanced Professional(>7yrs exp)"]
        
        levelTxt.optionArray = levelArray

        levelTxt.didSelect{(selectedText, index, id)  in
            print(selectedText)
            
            switch selectedText {
            case self.levelArray[0]:
                self.levelEnum = .HighSchool
            case self.levelArray[1]:
                self.levelEnum = .College
            case self.levelArray[2]:
                self.levelEnum = .GraduateSchool
            case self.levelArray[3]:
                self.levelEnum = .EarlyProfessional
            case self.levelArray[4]:
                self.levelEnum = .AdvancedProfessional
            default:
                print("defualts")
            }
            
            print("levelEnum.rawValue \(self.levelEnum.rawValue)")
            self.levelTxt.text = selectedText
        }
    }

    func validation() {
        
        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("here")
            // clear error label
            validationRule.errorLabel?.isHidden = true
            validationRule.errorLabel?.text = ""
        }, error:{ (validationError) -> Void in
            print("error")
            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage
        })
        
        validateTextAndErrorLabel(text: firstNameTxt, errorLabel: firstNameErrorLbl)
        validateTextAndErrorLabel(text: lastNameTxt, errorLabel: firstNameErrorLbl)
        validateTextAndErrorLabel(text: locationTxt, errorLabel: locationErrorLbl)
        validateTextAndErrorLabel(text: levelTxt, errorLabel: levelErrorLbl)
        
    }
    
    func validateTextAndErrorLabel(text: UITextField, errorLabel: UILabel) {
        validator.registerField(text, errorLabel: errorLabel, rules: [RequiredRule()])
    }
    
    @IBAction func sideBarBtn(sender: UIBarButtonItem) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
   
    @IBAction func uploadPrfilePicBtn(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            print("Button capture")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func uploadResumeBtn(sender: UIButton) {
        // doesn't work, we need app store account
        let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet]

        let importMenu = UIDocumentMenuViewController(documentTypes: types as [String], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
    }
    
    @IBAction func submitBtn(sender: UIButton) {
        validator.validate(self)
    }
    
    func goToVerficationView() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.verficationVC) as! VerficationController
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    

}

extension SecondStepSignUpController: ValidationDelegate {
    func validationSuccessful() {
        print("Success")
        generalInformation.name = "\(firstNameTxt.text ?? "") \(lastNameTxt.text ?? "")"
        generalInformation.level         = levelEnum.rawValue ?? "" // need to check
        generalInformation.admin         = "false" // true for employer
        generalInformation.isConfirmed   = "true"
        generalInformation.profileType   = "Normal"
      
        // location city  || state  || country
        let location = locationTxt.text?.components(separatedBy: "/")
        if location?.count == 3 {
            generalInformation.locationCity = location?[0] ?? ""
            generalInformation.locationState = location?[1] ?? ""
            generalInformation.locationCountry = location?[2] ?? ""
        } else if location?.count == 2 {
            generalInformation.locationCity = location?[0] ?? ""
            generalInformation.locationState = location?[1] ?? ""
        } else {
            generalInformation.locationCity = location?[0] ?? ""
        }
        
        /***/
        let ikigaiInfo                = IkigaiInfoModel()
        let highschoolInfo            = HighschoolInfoModel()
        let collegeInfo               = SchoolInfoModel()
        let graduateInfo              = SchoolInfoModel()
        let earlyProfessionalInfo     = ProfessionalExperienceInfoModel()
        let advancedProfessionalInfo  = ProfessionalExperienceInfoModel()
        
        
        //***
        let tagNames = TagsNameModel()
        tagNames.name = ""
        tagNames.tags = [String]()
        highschoolInfo.favoriteSubjects    = [tagNames]
        highschoolInfo.otherTraining       = [tagNames]
        highschoolInfo.impactfulActivities = [tagNames]
        
        //***//
        
        let positionInformationModel = PositionInformationModel()
        positionInformationModel.titlePosition = ""
        positionInformationModel.timeCommitment = ""
        positionInformationModel.duration = ""
        positionInformationModel.name = ""
        positionInformationModel.tags = [String]()
        
        highschoolInfo.sportsGames = [positionInformationModel]
        highschoolInfo.clubsOrgs   = [positionInformationModel]
        highschoolInfo.jobsInternshipsProjects = [positionInformationModel]
        highschoolInfo.otherInterests          = [positionInformationModel]
        
        //**** school info
        collegeInfo.majorMinor = [tagNames]
        collegeInfo.favoriteSubjects = [tagNames]
        collegeInfo.otherTraining = [tagNames]
        collegeInfo.impactfulActivities = [tagNames]
        collegeInfo.sportsGames = [positionInformationModel]
        collegeInfo.clubsOrgs   = [positionInformationModel]
        collegeInfo.jobsInternshipsProjects = [positionInformationModel]
        collegeInfo.otherInterests = [positionInformationModel]
       
        // graduate
        graduateInfo.majorMinor = [tagNames]
        graduateInfo.favoriteSubjects = [tagNames]
        graduateInfo.otherTraining = [tagNames]
        graduateInfo.impactfulActivities = [tagNames]
        graduateInfo.sportsGames = [positionInformationModel]
        graduateInfo.clubsOrgs   = [positionInformationModel]
        graduateInfo.jobsInternshipsProjects = [positionInformationModel]
        graduateInfo.otherInterests = [positionInformationModel]
        
        //** earlyProfessionalInfo
        earlyProfessionalInfo.positionsHeld = [positionInformationModel]
        earlyProfessionalInfo.clubsOrgs     = [positionInformationModel]
        earlyProfessionalInfo.otherInterests = [positionInformationModel]
        earlyProfessionalInfo.impactfulActivities = [tagNames]
        
        //advancedProfessionalInfo
        advancedProfessionalInfo.positionsHeld = [positionInformationModel]
        advancedProfessionalInfo.clubsOrgs     = [positionInformationModel]
        advancedProfessionalInfo.otherInterests = [positionInformationModel]
        advancedProfessionalInfo.impactfulActivities = [tagNames]
        
        
        sourceModel.generalInfo = generalInformation
        sourceModel.ikigaiInfo  = ikigaiInfo
        sourceModel.highschoolInfo = highschoolInfo
        sourceModel.collegeInfo  = collegeInfo
        sourceModel.graduateInfo = graduateInfo
        sourceModel.earlyProfessionalInfo = earlyProfessionalInfo
        sourceModel.advancedProfessionalInfo = advancedProfessionalInfo
        
        
        let param: [String: Any] = ["generalInfo": sourceModel.generalInfo!.toJSON(),
                                    "ikigaiInfo": sourceModel.ikigaiInfo!.toJSON(),
                                    "highschoolInfo": sourceModel.highschoolInfo!.toJSON(),
                                    "collegeInfo": sourceModel.collegeInfo!.toJSON(),
                                    "graduateInfo": sourceModel.graduateInfo!.toJSON(),
                                    "earlyProfessionalInfo": sourceModel.earlyProfessionalInfo!.toJSON(),
                                    "advancedProfessionalInfo": sourceModel.advancedProfessionalInfo!.toJSON()]
        
        http.post(path: APIConstants.baseURl + APIConstants.profileRegsiterURL, parameter: param, tag: 1)
        
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        print("error")
        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("here")
            // clear error label
            validationRule.errorLabel?.isHidden = true
            validationRule.errorLabel?.text = ""
        }, error:{ (validationError) -> Void in
            print("error")
            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage
        })
        
    }
}

extension SecondStepSignUpController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 40 {
            textField.endEditing(true)
            levelTxt.showList()
            return false
        }
        return true
    }
    
}

extension SecondStepSignUpController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print(image.description)
            
            self.dismiss(animated: true) {
                self.http.uploadImage(path: "\(APIConstants.baseURl)\(APIConstants.uploadImageURL)", image: image, tag: 2)
            }
        }

        
    }
}

extension SecondStepSignUpController: UIDocumentMenuDelegate, UIDocumentPickerDelegate {
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
    }
    
    
    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }

}
