//
//  SkillsChartView.swift
//  Epixego
//
//  Created by Moath Yahia on 7/25/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import Charts


class SkillsChartView: UIView {

    @IBOutlet var contentView                    : UIView!
    @IBOutlet fileprivate weak var skillsChart   : HorizontalBarChartView!

    var values: [Double] = [40.0, 35.0, 26.0, 90.0, 70.0, 60.0, 77.0, 80.0, 50.0]
    var moods = ["Other" ,"Academics" ,"Community Service" ,"Communication" ,"LeaderShip" ,"Games" ,"Sports" ,"Literary" ,"Art"]
    
    var colorArray: [UIColor] = [UIColor.init(hex: "A3C8D9") ,UIColor.init(hex: "4488A8") ,UIColor.init(hex: "BD9CD3") ,UIColor.init(hex: "9070C1"),UIColor.init(hex: "765DDC") ,UIColor.init(hex: "6764D8") ,UIColor.init(hex: "97ADEF") ,UIColor.init(hex: "4964C5"), UIColor.init(hex: "3E3AA4")]
    
    
    override func draw(_ rect: CGRect) {
        
        commonInit()
        setupChart()

    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SkillsChartView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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


extension SkillsChartView: ChartViewDelegate {
    
}

extension SkillsChartView: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return moods[Int(value) % moods.count]
    }
}
