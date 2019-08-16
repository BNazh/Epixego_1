//
//  ExpandableHeaderView.swift
//  Epixego
//
//  Created by Moath Yahia on 7/29/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate {
    func toggleSection(header: ExpandableHeaderView, section:Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var arrowImg  : UIImageView!
    @IBOutlet var titleLbl  : UILabel!

    var delegate: ExpandableHeaderViewDelegate?
    var section: Int!
   
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(tap: UITapGestureRecognizer) {
        let cell = tap.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section:cell.section)
    }
    
    
    func customInit(title: String, section: Int, delegate: ExpandableHeaderViewDelegate) {
        self.textLabel!.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
        self.textLabel?.textColor = UIColor.init(hex: "302D7D")
        self.contentView.backgroundColor = UIColor.white
        self.textLabel?.font = .boldSystemFont(ofSize: 16)
        CustomDesign.customAnyView(view: self, cornerRadius: 7.0, cornerColor: nil, cornerWidth: nil, shadowColor: UIColor.darkGray, shadowRadius: 2.0, shadowOpacity: 2.0)
    }

}
