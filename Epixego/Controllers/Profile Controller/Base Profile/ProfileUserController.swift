//
//  ProfileUserController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/17/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import Charts
import SDWebImage
import SideMenu

protocol AboutMeProtocol {
    func reloadDataFromAPi()
}

class ProfileUserController: UIViewController, AboutMeProtocol {

    @IBOutlet fileprivate weak var skillsChart   : HorizontalBarChartView!
    @IBOutlet fileprivate weak var profileImg    : UIImageView!
    @IBOutlet fileprivate weak var nameLbl       : UILabel!
    @IBOutlet fileprivate weak var jobTitleLbl   : UILabel!
    @IBOutlet weak var tableView                 : UITableView!

    var loginModel = LoginModel()
    lazy var http = HTTPController()
    lazy var profileModel = ProfileModel()
    var levelExperience = 0
    
    var values: [Double] = [40.0, 35.0, 26.0, 90.0, 70.0, 60.0, 77.0, 80.0, 50.0]
    var skills = ["Other", "Academics", "Community Service", "Communication", "LeaderShip", "Games", "Sports", "Literary", "Art"]
    
    var colorArray: [UIColor] = [UIColor.init(hex: "A3C8D9") ,UIColor.init(hex: "4488A8") ,UIColor.init(hex: "BD9CD3") ,UIColor.init(hex: "9070C1"),UIColor.init(hex: "765DDC") ,UIColor.init(hex: "6764D8") ,UIColor.init(hex: "97ADEF") ,UIColor.init(hex: "4964C5"), UIColor.init(hex: "3E3AA4")]
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    var flagLoadingData: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        http.delegate = self
        print(loginModel.type ?? "")
        fillData()
        setupView()
    }
    
    func setupView() {
        setupChart()
        
        CustomDesign.setBackgroundImage(view: self.view)
        profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
        profileImg.layer.masksToBounds = true
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = 50
        
        let professionalNib = UINib(nibName: "ProfessionalExperienceCell", bundle: nil)
        tableView.register(professionalNib, forCellReuseIdentifier: "professionalExerienceCell")
        
        let graduateSchoolNib = UINib(nibName: "GraduateSchoolCell", bundle: nil)
        tableView.register(graduateSchoolNib, forCellReuseIdentifier: "graduateSchoolCell")
    }
    
    @IBAction func sidebarBtn(sender: UIBarButtonItem) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    fileprivate func fillData() {
        self.title = "My Profile"
        profileImg.sd_cancelCurrentImageLoad()
        nameLbl.text = loginModel.source?.generalInfo?.name ?? ""
     
        let imageName = loginModel.source?.generalInfo?.profilePicture ?? ""

        let fullStr = APIConstants.baseURl + APIConstants.uploadURL + imageName
        
        values = loginModel.source?.genomeInfo?.members?.map({ Double($0.weight ?? 0) }) ?? [0.0]
        
        profileImg?.sd_setImage(with: URL(string: fullStr), placeholderImage: UIImage.init(named: "avatarBlack-icon"), options: .continueInBackground, completed: nil)
        

        let level = loginModel.source?.generalInfo?.level ?? ""

        switch level {
        case "hs":
            levelExperience = 2
        case "col":
            levelExperience = 3
        case "gs":
            levelExperience = 4
        case "ep":
            levelExperience = 5
        default:
            levelExperience = 2 // for testing now
        }
    }
    
    func setupChart()  {
        skillsChart.isUserInteractionEnabled = false
        skillsChart.dragEnabled = true
        skillsChart.setScaleEnabled(true)
        skillsChart.rightAxis.enabled = true
        skillsChart.delegate = self
        skillsChart.drawBarShadowEnabled = false
        skillsChart.drawValueAboveBarEnabled = true
        skillsChart.maxVisibleCount = 100

        let xAxis = skillsChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12)
        xAxis.labelTextColor = UIColor.white
        xAxis.drawAxisLineEnabled = true
        xAxis.granularity =   0
        xAxis.valueFormatter = self
        skillsChart.fitBars = true

        skillsChart.animate(yAxisDuration: 2.5)

        let spaceForBar = 10.0
        
        var chartDataEntry = [BarChartDataEntry]()
        
        for i in 0..<values.count {
            let value = BarChartDataEntry(x: Double(i)*spaceForBar  , y: values[i])
            chartDataEntry.append(value)
        }
        let chartDataSet = BarChartDataSet(entries: chartDataEntry, label: "")
        chartDataSet.drawValuesEnabled = true
        chartDataSet.colors = colorArray
        
        let chartMain = BarChartData()
        chartMain.barWidth = 6.0
        
        chartMain.addDataSet(chartDataSet)
        skillsChart.animate(yAxisDuration: 1.2)
        skillsChart.data = chartMain
    }
    
    func reloadDataFromAPi() {
        let path = APIConstants.baseURl + APIConstants.profileURL + UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId)
        http.get(path: path, parameter: [:], tag: 1)
    }
}

extension ProfileUserController: ChartViewDelegate {
    
}

extension ProfileUserController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return skills[Int(value) % skills.count]
    }
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
