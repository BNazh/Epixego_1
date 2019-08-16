//
//  DisplayAlertMessageExtension.swift
//  Epixego
//
//  Created by Moath Yahia on 7/16/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func displayAlertViewMessage(title: String, message: String) {
        if !message.isEmpty {
            let alertView = CPAlertVC.create().config(title: title, message: message)
            alertView.show(into: self)
        }
    }
    
    func displayAlertViewActions(title: String, message:String, actions: [CPAlertAction]) {
        if !message.isEmpty {
            let alertView = CPAlertVC.create().config(title: title, message: message)
            
            for action in actions {
                alertView.addAction(action)
            }
            alertView.show(into: self)
        }
    }
    
    func displayAlertSuccess(title: String, message: String) {
        if !message.isEmpty {
            let alertSuccess = SuccessAlertVC.create().config(title: title, message: message) as! SuccessAlertVC
            
            alertSuccess.showCheckImage(true)
            alertSuccess.show(into: self)
        }
    }
    
    func displayAlertSuccessAction(title: String, message: String, action: CPAlertAction) {
        if !message.isEmpty {
            let alertSuccess = SuccessAlertVC.create().config(title: title, message: message) as! SuccessAlertVC
            
            alertSuccess.showCheckImage(true)
            alertSuccess.show(into: self)
            
            alertSuccess.addAction(action)
        }
    }
    
    func displayAlertFailed(title: String, message: String) {
        if !message.isEmpty {
            let alertFailed = FailedAlertVC.create().config(title: title, message: message) as! FailedAlertVC
            
            alertFailed.showCheckImage(true)
            alertFailed.show(into: self)
        }
    }
    
    func displayAlertFailedAction(title: String, message: String, action: CPAlertAction) {
        if !message.isEmpty {
            let alertFailed = FailedAlertVC.create().config(title: title, message: message) as! FailedAlertVC
            
            alertFailed.showCheckImage(true)
            alertFailed.show(into: self)
            
            alertFailed.addAction(action)
        }
    }
}
