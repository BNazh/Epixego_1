//
//  ProfileDataSourceTableView.swift
//  Epixego
//
//  Created by Moath Yahia on 7/19/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit


extension ProfileUserController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelExperience
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ProfileTableViewCell
        
        if indexPath.row == 0 { // about me
            
            let info = flagLoadingData ? profileModel.ikigaiInfo : loginModel.source?.ikigaiInfo
            cell?.titleLbl.text = "About me"
            cell?.bodyLbl.text  = "I believe we can change the world by \(info?.improveWorld ?? "") My role model is \(info?.successfulPerson ?? "") because he/she \(info?.whatMakesSuccess ?? "") I describe myself as \(info?.selfDescribe ?? "") \n  \(info?.favoriteActivity ?? "") make me lose track of time \n If I could be anything, I would want to be \(info?.favoriteActivity ?? "")"
            cell?.titleLbl.text = "About me"
            cell?.bodyLbl.text  = "I believe we can change the world by \(info?.improveWorld ?? "") My role model is \(info?.successfulPerson ?? "") because he/she \(info?.whatMakesSuccess ?? "") I describe myself as \(info?.selfDescribe ?? "") \n  \(info?.favoriteActivity ?? "") make me lose track of time \n If I could be anything, I would want to be \(info?.favoriteActivity ?? "")"
           
            cell?.editBtn.addTarget(self, action: #selector(editAboutMeBtn(sender:)), for: .touchUpInside)
            
        } else if indexPath.row == 1 { // pro
            let profesionalExperienceCell = tableView.dequeueReusableCell(withIdentifier: "professionalExerienceCell") as! ProfessionalExperienceCell
                        
            if let tempProf = loginModel.source?.professionalInfo {
                profesionalExperienceCell.fillData(experience: tempProf)
            }
            
            profesionalExperienceCell.editBtn.addTarget(self, action: #selector(editProfessional), for: .touchUpInside)
          
            return profesionalExperienceCell
        } else if indexPath.row == 2 { // graduateSchool
            let graduateSchoolCell = tableView.dequeueReusableCell(withIdentifier: "graduateSchoolCell") as! GraduateSchoolCell
            
            if let tempGraduateInfo = loginModel.source?.graduateInfo {
                graduateSchoolCell.fillData(data: tempGraduateInfo, tag: 1)
            }
            
            graduateSchoolCell.editBtn.tag = indexPath.row
            graduateSchoolCell.editBtn.addTarget(self, action: #selector(editGraduateBtn), for: .touchUpInside)
            return graduateSchoolCell
            
        } else if indexPath.row == 3 { //under graduate
          
            let underGraduateCell = tableView.dequeueReusableCell(withIdentifier: "graduateSchoolCell") as! GraduateSchoolCell
            
            if let tempUnderGraduateInfo = loginModel.source?.collegeInfo {
                underGraduateCell.fillData(data: tempUnderGraduateInfo, tag: 2)
            }
            
            underGraduateCell.editBtn.tag = indexPath.row
            underGraduateCell.editBtn.addTarget(self, action: #selector(editUnderGraduateBtn), for: .touchUpInside)
            return underGraduateCell
        } else if indexPath.row == 4 { //HIGH SCHOOL

           let highSchoolCell = tableView.dequeueReusableCell(withIdentifier: "professionalExerienceCell") as! ProfessionalExperienceCell
                                 
            if let tempHighSchoolData = loginModel.source?.highschoolInfo {
                highSchoolCell.fillHighSchoolData(data: tempHighSchoolData)
            }
                    
            highSchoolCell.editBtn.addTarget(self, action: #selector(editHighSchoolBtn), for: .touchUpInside)
                   
            return highSchoolCell
        }
       
        return cell!
    }
    
    @objc private func editProfessional(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.experienceProfileVC) as! ExperienceController
        
        if let professionalInfo = loginModel.source?.professionalInfo {
            controller.professionalInfoModel = professionalInfo
        }
        
        let navigation = UINavigationController(rootViewController: controller)
        self.present(navigation, animated: true, completion: nil)
    }
    
    @objc private func editAboutMeBtn(sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: ConstantControllers.aboutMeVC) as! AboutMeController
        
        let navigation = UINavigationController(rootViewController: controller)
        if let info = loginModel.source?.ikigaiInfo {
            controller.infoModel = info
        }
        controller.aboutmeDelegate = self
        self.present(navigation, animated: true, completion: nil)
    }
    
    @objc private func editGraduateBtn(sender: UIButton) {
        
    }
    
    @objc private func editUnderGraduateBtn(sender: UIButton) {
        
    }
    
    @objc private func editHighSchoolBtn(sender: UIButton) {
        
    }
}
