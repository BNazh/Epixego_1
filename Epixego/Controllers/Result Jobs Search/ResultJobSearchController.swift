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

enum JobStatus: String {
    case applied
    case contacted
    case saved
    case rejected
}

class ResultJobSearchController: UIViewController, UIAdaptivePresentationControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterItemBtn: UIBarButtonItem!
    
    var resultJobsModel = ResultJobsModel()
    lazy var  itemsResultJobModel = [ItemsResultJobsModel]()

    lazy var http = HTTPController()
    var jobStatus = JobStatus.applied

    var keywordValue: String = String()
    fileprivate var size = 10
    fileprivate var from = 1 // number of page
    var fetchData: Bool = false
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
        
        //************//
        
//        GetAction()

    }

    func GetAction() {

       /* let headers = [
            "Content-Type": "application/json"
        ]
        let parameters = [
            "state": "applied",
            "start": "0",
            "size": "10"
            ] as [String : Any]
        do {
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://13.56.79.215:3000/epixego/findJobs4Candidate/nCxSRWwBGizRVg2qRDP0")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
        } catch {
            print("error")
        }*/
        
        let parameters = [
            "state": "applied",
            "start": "0",
            "size": "10"
            ] as [String : Any]
        
        var request = "http://13.56.79.215:3000/epixego/findJobs4Candidate/nCxSRWwBGizRVg2qRDP0"
        
        
        Alamofire.request(request, method: .get, parameters: parameters, encoding: JSONEncoding.default).responseJSON() {(response) in
        
        print(response)
    }
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
                self.jobStatus = .rejected
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
            
            self.filterData()
        };
    }
    
    fileprivate func filterData() {
        let statusResult: String = jobStatus.rawValue

        let param = [
            "state": statusResult,
            "start": "0",
            "size": "10"
            ] as [String : Any]
        
        let userId = UserDefaultDB.shared.getUserDefaultString(key: DBLocalKeys.userId)
        let fullUrl: String = "\(APIConstants.baseURl)\(APIConstants.searchJobStatusURL)\(userId)"
        http.get(path: fullUrl, parameter: param, tag: 1)
    }
    
    @IBAction fileprivate func filterBtn(sender: UIBarButtonItem) {

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
