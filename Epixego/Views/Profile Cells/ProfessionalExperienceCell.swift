//
//  ProfessionalExperienceCell.swift
//  Epixego
//
//  Created by Moath Yahia on 9/24/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ProfessionalExperienceCell: UITableViewCell {

    @IBOutlet private weak var containView     : UIView!
    @IBOutlet private var subView              : [UIView]!
    
    @IBOutlet private weak var titleLbl        : UILabel!
    @IBOutlet private weak var dataLbl         : UILabel!
    @IBOutlet weak var titleExeperienceLbl     : UILabel!
    @IBOutlet weak var experienceActivityLbl   : UILabel!
    @IBOutlet weak var otherLbl                : UILabel!
    @IBOutlet weak var adviceLbl               : UILabel!
    @IBOutlet weak var editBtn                 : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CustomDesign.customDesignView(view: containView)
        
        for view in subView {
            CustomDesign.customAnyView(view: view, cornerRadius: 6, cornerColor: UIColor.init(hex: "3E3AA4"), cornerWidth: 1.0, shadowColor: nil, shadowRadius: nil, shadowOpacity: nil)
        }
    }

    func fillData(experience: ProfessionalExperienceInfoModel) {
        titleLbl.text = "PROFESSIONAL EXPERIENCE"
        var experienceText = ""
        var dateStr = ""
        for exp in (experience.positionsHeld ?? []) {
            dateStr += "\(exp.startDate ?? "") - \(exp.endDate ?? "") \n"
            
            experienceText += "\t\(exp.name ?? "") at \(exp.companyInstitution ) from \(exp.startDate ?? "") - \(exp.endDate ?? "") \n • This is what I do in my job: \(exp.workDescription ?? "") \n • What I like best about my job: \(exp.bestPartOfWorking ?? "") \n • The not-so-fun part of my job is: \(exp.canBeImproved ?? "") \n • My proudest moment at this job was: \(exp.proudestAcomplishments ?? "") \n \t º º º\n"
        }
        titleExeperienceLbl.text = experienceText.trimmingCharacters(in: .newlines)
        dataLbl.text = dateStr.trimmingCharacters(in: .newlines)

        var activityText = ""
        for activity in experience.impactfulActivities ?? [] {
            activityText += " \(activity.name ?? "")"
        }
        let activity = "My experience with \(activityText) has/ve been most impactful in my growth.\n\n10 years from now, I aspire to be"
        experienceActivityLbl.text = activity
        
        var others = ""
        
        for other in experience.otherInterests ?? [] {
            others += "other \n \t \(other.name ?? "") \(other.titlePosition ?? "")"
        }
        
        otherLbl.text = others
        adviceLbl.text = "Advice I would give to my younger self, \(experience.adviceToSelf ?? "")"
    }
    
    func fillHighSchoolData(data: HighschoolInfoModel) {
        dataLbl.isHidden = false
        titleLbl.text = "HIGH SCHOOL"
        
        dataLbl.text = "Graduated from \(data.name ?? ""), \(data.locationCity ?? ""), \(data.locationState ?? ""), \(data.locationCountry ?? "") on \(data.graduationYear ?? "")"
        
        var favoriteSubject = ""
        for val in data.favoriteSubjects ?? [] {
            favoriteSubject = "\(favoriteSubject)\(val.name ?? ""), "
        }
        
        titleExeperienceLbl.text = "My favorite subject/course/s are/were \(favoriteSubject.dropLast(2))"
        
        var clubs = ""
        for val in data.clubsOrgs ?? [] {
            clubs = "\(clubs) \n • \(val.name?.trimmingCharacters(in: .newlines) ?? "") as \(val.titlePosition ?? "")"
        }

        var sportGames = ""
        for val in data.sportsGames ?? [] {
            sportGames = "\(sportGames) \n • \(val.name?.trimmingCharacters(in: .newlines) ?? "") as \(val.titlePosition ?? "")"
        }
        
        experienceActivityLbl.text = "In school, I am/was part of \(clubs)\(sportGames)"
        
        
        var jobs = ""
        for val in data.jobsInternshipsProjects ?? [] {
            jobs = "\(jobs)\(val.name ?? ""), "
        }
        
        var offCampus = ""
        for val in data.otherTraining ?? [] {
            offCampus = "\(offCampus)\(val.name ?? ""), "
        }
        
        var otherInterests = ""
        for val in data.otherInterests ?? [] {
            otherInterests = "\(otherInterests)\(val.name ?? ""), "
        }
              
        
        otherLbl.text = "The experiential learning (Internships/study abroad/summer courses) I took are/were \(jobs) \(offCampus.dropLast(2)) \n Other significant activities (outside of school) that i participated in are/were \(otherInterests.dropLast(2))"

        
        
        var activities = ""
        for val in data.impactfulActivities ?? [] {
            activities = "\(activities) \(val.name ?? ""), "
        }
      
        var proudest = ""
        for val in data.proudestAcomplishments ?? [""] {
            proudest = "\(proudest) \(val), "
        }
        adviceLbl.text = "The experience that I think has/had the most impact on me is \n\(activities.dropLast(2)) \nI am most proud of \(proudest.dropLast(2))"
    }
}
