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

class ProfileUserController: UIViewController {

    @IBOutlet fileprivate weak var skillsChart   : HorizontalBarChartView!
    @IBOutlet fileprivate weak var profileImg    : UIImageView!
    @IBOutlet fileprivate weak var nameLbl       : UILabel!
    @IBOutlet fileprivate weak var jobTitleLbl   : UILabel!
    @IBOutlet weak var tableView                 : UITableView!

    var loginModel = LoginModel()

    var values: [Double] = [40.0, 35.0, 26.0, 90.0, 70.0, 60.0, 77.0, 80.0, 50.0]
    var moods = ["Other" ,"Academics" ,"Community Service" ,"Communication" ,"LeaderShip" ,"Games" ,"Sports" ,"Literary" ,"Art"]
    
    var colorArray: [UIColor] = [UIColor.init(hex: "A3C8D9") ,UIColor.init(hex: "4488A8") ,UIColor.init(hex: "BD9CD3") ,UIColor.init(hex: "9070C1"),UIColor.init(hex: "765DDC") ,UIColor.init(hex: "6764D8") ,UIColor.init(hex: "97ADEF") ,UIColor.init(hex: "4964C5"), UIColor.init(hex: "3E3AA4")]
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print(loginModel.type ?? "")
        setupView()
        
        fillData()
    }
    
    fileprivate func fillData() {
        nameLbl.text = loginModel.source?.generalInfo?.name ?? ""
     
       
        let imageName = loginModel.source?.generalInfo?.profilePicture ?? ""
        
        let url: URL = URL(string: imageName)!
        
//        let url = URL(fileURLWithPath: imageName)
        
        if let theProfileImageUrl = URL(string: imageName) {
            do {
                let imageData = try Data(contentsOf: theProfileImageUrl as URL)
                profileImg.image = UIImage(data: imageData)
            } catch {
                print("Unable to load data: \(error)")
            }
        }

        
        let imageData = NSData(contentsOf: url)
        
//        let image = UIImage(data: imageData as! Data)
        
        
        
        profileImg.image = load(fileName: imageName)
   
    }
    
    private func load(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    
    func setupView() {
        setupChart()
        
        CustomDesign.setBackgroundImage(view: self.view)
        
        profileImg.layer.cornerRadius = profileImg.frame.width / 2
        profileImg.layer.masksToBounds = true
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")

        tableView.estimatedRowHeight = 50

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
    

}


extension ProfileUserController: ChartViewDelegate {
    
}

extension ProfileUserController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return moods[Int(value) % moods.count]
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
