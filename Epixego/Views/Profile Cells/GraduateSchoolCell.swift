//
//  GraduateSchoolCell.swift
//  Epixego
//
//  Created by Moath Yahia on 9/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class GraduateSchoolCell: UITableViewCell {
    @IBOutlet private weak var containView               : UIView!

    @IBOutlet weak var titleLbl                          : UILabel!
    @IBOutlet private var subView                        : [UIView]!

    @IBOutlet private weak var graduadteSchoolLbl        : UILabel!
    @IBOutlet private weak var minorsLbl                 : UILabel!
    @IBOutlet private weak var majorsLbl                 : UILabel!
    @IBOutlet private weak var favoriteSubjectLbl        : UILabel!
    @IBOutlet private weak var accomplishmentsLbl        : UILabel!
    @IBOutlet private weak var sportGameLbl              : UILabel!
    @IBOutlet private weak var clubOrganizationLbl       : UILabel!
    @IBOutlet private weak var experientialLearningLbl   : UILabel!

    @IBOutlet weak var editBtn                           : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        CustomDesign.customDesignView(view: containView)
        
        for view in subView {
            CustomDesign.customAnyView(view: view, cornerRadius: 6, cornerColor: UIColor.init(hex: "3E3AA4"), cornerWidth: 1.0, shadowColor: nil, shadowRadius: nil, shadowOpacity: nil)
        }
    }
    
    func fillData(data: SchoolInfoModel, tag: Int) {
        if tag == 1 {
            titleLbl.text = "GRADUATE SCHOOL"
        } else if tag == 2 {
            titleLbl.text = "COLLEGE / UNDERGRADUATE"
        }
      
        var majors = "GRADUATE SCHOOL"
        for val in data.major ?? [] {
            majors = "\(majors)\(val.name ?? ""), "
        }
        if data.degree != "" && data.name != "" {
            graduadteSchoolLbl.text = "\(data.degree ?? "") in \(majors.dropLast(2)) from \(data.name ?? ""), \(data.locationCity ?? ""), \(data.locationState ?? ""), \(data.locationCountry ?? ""), \(data.graduationYear ?? "")"
        }

        var minor = ""
        for val in data.minor ?? [] {
            minor = "\(minor)\(val.name ?? ""), "
        }
        
        minorsLbl.text = "I minored in \(minor.dropLast(2))"
        majorsLbl.text = "I majored in \(majors.dropLast(2))"
        
        var favoriteSub = ""
        for val in data.favoriteSubjects ?? [] {
            favoriteSub = "\(favoriteSub)\(val.name ?? ""), "
        }
        
        favoriteSubjectLbl.text = "My favorite subjects are/were \(favoriteSub.dropLast(2))"
        
        var accomplishments = ""
        for val in data.proudestAcomplishments ?? [] {
            accomplishments = "\(accomplishments)\(val), "
        }
        accomplishmentsLbl.text = "I am most proud of \(accomplishments.dropLast(2))"
        
        var sportGames = ""
        for val in data.sportsGames ?? [] {
            sportGames = "\(sportGames) \n\(val.name ?? ""), "
        }
        sportGameLbl.text = "I am/was part of \t \(sportGames.dropLast(2))"
        
        var club = ""
        for val in data.clubsOrgs ?? [] {
            club = "\(club) \n\(val.name ?? ""), "
        }
        clubOrganizationLbl.text = "I am/was part of \t \(club.dropLast(2))"
        
        
        var jobInterShip = ""
        for val in data.jobsInternshipsProjects ?? [] {
            jobInterShip = "\(jobInterShip)\(val.name ?? ""), "
        }
        var otherTraining = ""
        for val in data.otherTraining ?? [] {
            otherTraining = "\(otherTraining)\(val.name ?? "")"
        }
        
        var activity = ""
        for val in data.impactfulActivities ?? [] {
            activity = "\(activity)\(val.name ?? ""), "
        }
        experientialLearningLbl.text = "The experiential learning (Internships/study abroad/summer courses) I took are/were \(jobInterShip.dropLast(2)), \(otherTraining.dropLast(2)) \nThe experience that I think has/had the most impact on my learning \(activity.dropLast(2))"
    }
    
}
