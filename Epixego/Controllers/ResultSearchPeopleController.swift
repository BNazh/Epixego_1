//
//  ResultSearchPeopleController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/22/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

class ResultSearchPeopleController: UIViewController {
    
    @IBOutlet weak var tableView     : UITableView!
 
    var resutlPeopleSearchModel = ResultSearchPeopleModel()
    lazy var itemResultPeopleModel = [ItemsSearchPeopleModel]()
    lazy var http = HTTPController()
    
    var size = Int()
    var from = Int()
    var fetchData = false
    var totalItems = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        http.delegate = self
        itemResultPeopleModel = resutlPeopleSearchModel.items ?? []
        totalItems = resutlPeopleSearchModel.total ?? 0
    }
    
    func ss(dd: String...) {}
    
    func setupView() {
        let nib = UINib.init(nibName: "ResultSearchPeopleCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func refillData() {
        fetchData = true
        size = 10
        from += 1
        
        let urlString = "\(resutlPeopleSearchModel.namePeople ?? "")" + "?&from=" + "\(from)" + "&size=" + "\(size)"
        
        http.get(path: "\(APIConstants.baseURl + APIConstants.searchPeopleURL)\(urlString)", parameter: [:], tag: 1)
    }
}
