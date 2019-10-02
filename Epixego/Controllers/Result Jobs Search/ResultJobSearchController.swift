//
//  ResultJobSearchController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/30/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import PopOverMenu
import Foundation
import Alamofire

class ResultJobSearchController: UIViewController, UIAdaptivePresentationControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterItemBtn: UIBarButtonItem!
    
    var resultJobsModel = ResultJobsModel()
    lazy var  itemsResultJobModel = [ItemsResultJobsModel]()

    lazy var http = HTTPController()
    var jobStatus = EnumsConstants.JobStatus.applied
    
    var keywordValue: String = String()
    fileprivate var size = 10
    fileprivate var from = 1 // number of page
    var fetchData: Bool = false
    var flagFilter: Bool = false
    var totalItems = Int()
    
    lazy var popOverViewController = PopOverViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        http.delegate = self
        itemsResultJobModel = resultJobsModel.items ?? []
        totalItems          = resultJobsModel.total ?? 0
        setupView()
    }

    fileprivate func setupView() {
        let nib = UINib(nibName: "ResultSearchJobsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.footerView(forSection: .max)
        setupPopOverView()
    }
    
    func reFillData() {
        fetchData = true
        size = 10
        from += 1
        
        let path = keywordValue + "&size=" + "\(size)" + "&page=" + "\(from)"
        
        let fullUrl: String = "\(APIConstants.baseURl)\(APIConstants.searchInternshipURL)\(path)"
        http.get(path: fullUrl, parameter: [:], tag: 1)
    }
    
    fileprivate func setupPopOverView() {
        let titles = ["SUGGESTED", "CONTACTED", "SAVED", "APPLIED"]
        
        popOverViewController = PopOverViewController.instantiate()
        popOverViewController.set(titles: titles)
        popOverViewController.set(separatorStyle: .singleLine)
        popOverViewController.preferredContentSize = CGSize(width: 170, height:176)

        popOverViewController.completionHandler = { selectRow in
            self.popOverViewController.set(selectRow: selectRow)

            switch (selectRow) {
            case 0:
                self.jobStatus = .suggested
                break
            case 1:
                self.jobStatus = .contacted
                break
            case 2:
                self.jobStatus = .saved
                break
            case 3:
                self.jobStatus = .applied
                break
            default:
                break
            }
            self.flagFilter = true
            self.filterData()
        };
    }
    
    internal func filterData() {
        let statusResult: String = jobStatus.rawValue
        let param = [
            "state": statusResult,
            "start": "0",
            "size": "10"
            ]
        
        let userId = UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId)
        let fullUrl: String = "\(APIConstants.baseURl)\(APIConstants.searchJobStatusURL)\(userId)"
        http.post(path: fullUrl, parameter: param, tag: 2)
    }
    
    @IBAction private func filterBtn(sender: UIBarButtonItem) {

        popOverViewController.presentationController?.delegate = self
        popOverViewController.popoverPresentationController?.barButtonItem = sender
        present(popOverViewController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
