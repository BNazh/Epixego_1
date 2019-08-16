//
//  QuestionsLandingController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/26/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class QuestionsLandingController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var questionModel = [QuestionsModel]()
    
    let descEpixegoFor = "Epixego is for students: especially those in college. Today, almost 80% of the undergraduate students reported changing their college major within the first couple of years because they are unclear if they still like the major, and/or enable them to secure a career that they will enjoy. About 2/3rd, of the millennials reported not being engaged at work, and seeking to change careers not just jobs. With a rapidly changing employment landscape, this problem is only set to compound without a scalable way for students (and employers) to identify an efficient and comprehensive way to move easily among lanes, transfer skills gained from in-classroom and outside of the classroom. Epixego is for you. Whether you are entering college, in college, or soon to graduate from college, Epixego is for you."
    
    let descDifferent = "In a world of constant change, today’s students need a different approach to education: one that leverages every experience for growth and success. Experiences such as courses, internships, or co-op, but also online courses, hackathons clubs, volunteerism, service projects, extracurriculars and many more. Ask a student and they will tell you: Often the best advisers are near peers (like upperclassmen) from similar backgrounds who graduated from college just a few years ago. Young alums' unique insights about starting a career, is often key, as they think about the college to career pathway. The most practical tips are likely to come from a recent grad who figured out how to land a job or an internship, even when the company wasn't hiring. Epixego’s platform provides a broader canvas for students to define their skills and competencies. This comprehensive skills canvas (aka skills fingerprint) is used to show students near peers (upperclassmen) like them: role models. We see that the insight a student gains by seeing others like them, the experiences that shaped that college to career pathway is monumental; especially for careers and majors that perhaps did not exist 10-15 years ago. Through Epixego’s platform, students can further their insights by applying to relevant experiential learning opportunities."
    
    let descExperientialLearning = "Experiential learning is the process of learning first-hand through experience. While classrooms can be great with teaching abstract conceptualization, it is only through experiential learning opportunities that the students have the ability to apply, experiment, and learn. Epixego’s experiential learning opportunities include traditional internships, micro-internships, externships, co-op, research positions, pro-bono or service learning opportunities and more. They provide the student the opportunity to apply, and evaluate first-hand the potential college to career path."
    
    let descHowHelpMe = "Every student entering college and employment world seems to repeat the discovery process that their immediate predecessors have already gone through. We think it would be AMAZING to democratize the lessons learnt, and flip the statistic of disillusioned generation of young workers who are looking to change careers. We help students discover college to career paths that recognize their unique strengths. A student who sees success through their strengths, through others like them, is likely to be more engaged in the purposeful education and career path chosen. By connecting students to experiential opportunities in the chosen area, students position themselves better to demonstrate to employers not just what they know, but what they can do. You gain confidence to follow your “true north”, and chart a purposeful trajectory for your truly inspiring career."
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        CustomDesign.setBackgroundImage(view: self.view)
        questionModel = [QuestionsModel(title: "Who is Expixego for?", description: descEpixegoFor, expanded: false),
                         QuestionsModel(title: "How is this Different?", description: descDifferent, expanded: false),
                         QuestionsModel(title: "What is Experiential Learning?", description: descExperientialLearning, expanded: false),
                         QuestionsModel(title: "How will this help me?", description: descHowHelpMe, expanded: false)]
        
        tableView.estimatedRowHeight = 50
        
        let nib = UINib(nibName: "QuestionsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        CustomDesign.customAnyView(view: tableView, cornerRadius: 7.0)
    }

}
