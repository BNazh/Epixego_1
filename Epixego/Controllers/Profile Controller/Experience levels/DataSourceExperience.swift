//
//  DataSourceExperience.swift
//  Epixego
//
//  Created by Moath Yahia on 9/13/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit

extension ExperienceController: UITableViewDataSource {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        11
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return professionalInfoModel.positionsHeld?.count ?? 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return professionalInfoModel.clubsOrgs?.count ?? 1
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return professionalInfoModel.otherInterests?.count ?? 1
        } else if section == 5 {
            return 1
        } else if section == 6 {
            return professionalInfoModel.impactfulActivities?.count ?? 1
        } else if section == 7 {
            return 1
        } else if section == 8 {
            return professionalInfoModel.proudestAcomplishments?.count ?? 1
        } else if section == 9 {
            return 1
        } else {
            return 4
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let addFieldCell = tableView.dequeueReusableCell(withIdentifier: "addFieldCell") as! AddFieldCell
        
        if indexPath.section == 0 {
            let titleCell = tableView.dequeueReusableCell(withIdentifier: "titlePositionCell") as! TitlePositionCell
            dicProfessionalInfo[indexPath.row] = titleCell
            if let held = professionalInfoModel.positionsHeld?[indexPath.row] {
                titleCell.fillData(positionsHeld: held)
            }
            if indexPath.row == 0 {
                titleCell.trashBtn.isHidden = true
            } else {
                titleCell.trashBtn.isHidden = false
            }
            titleCell.trashBtn.addTarget(self, action: #selector(deleteHeldBtn), for: .touchUpInside)
            titleCell.trashBtn.tag = indexPath.row
            
            return titleCell
        }
        
        if indexPath.section == 1 {
            if professionalInfoModel.positionsHeld?.count == 3 {
                addFieldCell.addFieldBtn.isUserInteractionEnabled = false
            }
            addFieldCell.addFieldBtn.tag = indexPath.section
            addFieldCell.addFieldBtn.addTarget(self, action: #selector(addHeldfieldBtn), for: .touchUpInside)
            return addFieldCell
        }
        
        if indexPath.section == 2 {
            let clubCell = tableView.dequeueReusableCell(withIdentifier: "clubOrganizationCell") as! ClubOrganizationCell
            dicClubOrganiztion[indexPath.row] = clubCell
            if let club = professionalInfoModel.clubsOrgs?[indexPath.row] {
                clubCell.fillData(clubOrganization: club)
            }
            if indexPath.row == 0 {
                clubCell.trashBtn.isHidden = true
            }  else {
                clubCell.trashBtn.isHidden = false
            }
            clubCell.trashBtn.addTarget(self, action: #selector(deleteClubBtn), for: .touchUpInside)
            clubCell.trashBtn.tag = indexPath.row
            return clubCell
        }
   
        if indexPath.section == 3 {
            if professionalInfoModel.clubsOrgs?.count == 3 {
                addFieldCell.addFieldBtn.isUserInteractionEnabled = false
            }
            addFieldCell.addFieldBtn.addTarget(self, action: #selector(addClubBtn), for: .touchUpInside)
            addFieldCell.addFieldBtn.tag = indexPath.section

            return addFieldCell
        }
        
        if indexPath.section == 4 {
            let otherInterestsCell = tableView.dequeueReusableCell(withIdentifier: "otherInterestsCell") as! OtherInterestsCell
            dicOtherInterests[indexPath.row] = otherInterestsCell
            
            if let tempOtherInterested = professionalInfoModel.otherInterests?[indexPath.row] {
                otherInterestsCell.fillData(data: tempOtherInterested)
            }
            if indexPath.row == 0 {
                otherInterestsCell.trashBtn.isHidden = true
            } else {
                otherInterestsCell.trashBtn.isHidden = false
            }
            otherInterestsCell.trashBtn.addTarget(self, action: #selector(deleteOtherInterestsBtn), for: .touchUpInside)
            otherInterestsCell.trashBtn.tag = indexPath.row
            
            return otherInterestsCell
        }
        
        if indexPath.section == 5 {
            if professionalInfoModel.otherInterests?.count == 3 {
                addFieldCell.addFieldBtn.isUserInteractionEnabled = false
            }
            
            addFieldCell.addFieldBtn.addTarget(self, action: #selector(addOtherInterestsfieldBtn), for: .touchUpInside)
            addFieldCell.addFieldBtn.tag = indexPath.section
            return addFieldCell
        }
        
        if indexPath.section == 6 {
            let activitiesCell = tableView.dequeueReusableCell(withIdentifier: "activitiesCell") as! ActivitiesCell
            dicActivities[indexPath.row] = activitiesCell
            
            if let tempActivites = professionalInfoModel.impactfulActivities?[indexPath.row] {
                activitiesCell.fillData(data: tempActivites)
            }
            if indexPath.row == 0 {
                activitiesCell.trashBtn.isHidden = true
            } else {
                activitiesCell.trashBtn.isHidden = false
            }
            activitiesCell.trashBtn.addTarget(self, action: #selector(deleteActivityBtn), for: .touchUpInside)
            activitiesCell.trashBtn.tag = indexPath.row
            return activitiesCell
        }
        if indexPath.section == 7 {
            if professionalInfoModel.impactfulActivities?.count == 3 {
                addFieldCell.addFieldBtn.isUserInteractionEnabled = false
            }
            addFieldCell.addFieldBtn.tag = indexPath.section
            addFieldCell.addFieldBtn.addTarget(self, action: #selector(addActivityfieldBtn), for: .touchUpInside)
            return addFieldCell
        }
        
        if indexPath.section == 8 {
            let generalProfileCell = tableView.dequeueReusableCell(withIdentifier: "generalProfileCell") as! GeneralProfileCell
            dicProudestAcomplishments[indexPath.row] = generalProfileCell
            
            if let tempProudectAcomplishment = professionalInfoModel.proudestAcomplishments?[indexPath.row] {
                generalProfileCell.fillDataProudestAcomplishment(data: tempProudectAcomplishment, title: "Proudest Accomplishment(s)")
            }
            if indexPath.row == 0 {
                generalProfileCell.trashBtn.isHidden = true
            } else {
                generalProfileCell.trashBtn.isHidden = false
            }
            
            generalProfileCell.trashBtn.addTarget(self, action: #selector(deleteProudestBtn), for: .touchUpInside)
            generalProfileCell.trashBtn.tag = indexPath.row

            return generalProfileCell
        }
        if indexPath.section == 9 {
            if professionalInfoModel.proudestAcomplishments?.count == 3 {
                    addFieldCell.addFieldBtn.isUserInteractionEnabled = false
            }
            addFieldCell.addFieldBtn.tag = indexPath.section
            addFieldCell.addFieldBtn.addTarget(self, action: #selector(addProudestfieldBtn), for: .touchUpInside)
            return addFieldCell

        } else { // 4 cells
            let generalProfileCell = tableView.dequeueReusableCell(withIdentifier: "generalProfileCell") as! GeneralProfileCell
            generalProfileCell.trashBtn.isHidden = true
//            dicGeneralInfo[indexPath.row] = generalProfileCell
            generalProfileCell.fillData(row: indexPath.row, data: professionalInfoModel)

            return generalProfileCell
        }
        
    }
    
    @objc private func addHeldfieldBtn(sender: UIButton) {
        if sender.tag != 1 {
            return
        }
        tableView.beginUpdates()
        let temp = PositionsHeldModel()
        professionalInfoModel.positionsHeld?.append(temp)
        
        tableView.insertRows(at: [IndexPath(row: (professionalInfoModel.positionsHeld?.count ?? 1) - 1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    @objc private func addClubBtn(sender: UIButton) {
        if sender.tag != 3 {
            return
        }
           tableView.beginUpdates()
           let temp = PositionInformationModel()
           professionalInfoModel.clubsOrgs?.append(temp)
           
           tableView.insertRows(at: [IndexPath(row: (professionalInfoModel.clubsOrgs?.count ?? 1) - 1, section: 2)], with: .automatic)
           tableView.endUpdates()
       }
    
    @objc private func addOtherInterestsfieldBtn(sender: UIButton) {
        if sender.tag != 5 {
            return
        }
        
        tableView.beginUpdates()
        let temp = PositionInformationModel()
        professionalInfoModel.otherInterests?.append(temp)
        
        tableView.insertRows(at: [IndexPath(row: (professionalInfoModel.otherInterests?.count ?? 1) - 1, section: 4)], with: .automatic)
        tableView.endUpdates()
    }
    
    @objc private func addActivityfieldBtn(sender: UIButton) {
        if sender.tag != 7 {
            return
        }
        tableView.beginUpdates()
        let temp = TagsNameModel()
        professionalInfoModel.impactfulActivities?.append(temp)
            
        tableView.insertRows(at: [IndexPath(row: (professionalInfoModel.impactfulActivities?.count ?? 1) - 1, section: 6)], with: .automatic)
        tableView.endUpdates()
    }
    
    @objc private func addProudestfieldBtn(sender: UIButton) {
        if sender.tag != 9 {
            return
        }
        tableView.beginUpdates()
        let temp = String()
        professionalInfoModel.proudestAcomplishments?.append(temp)
                   
        tableView.insertRows(at: [IndexPath(row: (professionalInfoModel.proudestAcomplishments?.count ?? 1) - 1, section: 8)], with: .automatic)
        tableView.endUpdates()
    }
    
    @objc private func deleteHeldBtn(sender: UIButton) {
        professionalInfoModel.positionsHeld?.remove(at: sender.tag)
        dicProfessionalInfo.removeValue(forKey: sender.tag)
        removerRowsFromTableView(tag: sender.tag, section: 0)
    }
    
    @objc private func deleteClubBtn(sender: UIButton) {
        professionalInfoModel.clubsOrgs?.remove(at: sender.tag)
        dicClubOrganiztion.removeValue(forKey: sender.tag)
        removerRowsFromTableView(tag: sender.tag, section: 2)
    }
    
    @objc private func deleteOtherInterestsBtn(sender: UIButton) {
        professionalInfoModel.otherInterests?.remove(at: sender.tag)
        dicOtherInterests.removeValue(forKey: sender.tag)
        removerRowsFromTableView(tag: sender.tag, section: 4)
    }
    
    @objc private func deleteActivityBtn(sender: UIButton) {// problem here
        professionalInfoModel.impactfulActivities?.remove(at: sender.tag)
        dicActivities.removeValue(forKey: sender.tag)
        removerRowsFromTableView(tag: sender.tag, section: 6)
    }
    
    @objc private func deleteProudestBtn(sender: UIButton) {
        professionalInfoModel.proudestAcomplishments?.remove(at: sender.tag)
        dicProudestAcomplishments.removeValue(forKey: sender.tag)
        removerRowsFromTableView(tag: sender.tag, section: 8)
    }
    
    private func removerRowsFromTableView(tag: Int, section: Int) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: tag, section: section)], with: .automatic)
        tableView.endUpdates()
    }
}
