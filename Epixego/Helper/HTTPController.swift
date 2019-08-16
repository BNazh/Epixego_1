//
//  HTTPController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/11/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper
import SVProgressHUD
import Alamofire
import SystemConfiguration

protocol HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String: Any], tag: Int)
    func receivedErrorWithMessage(_ message: String)
}

class HTTPController  {
    
    var delegate: HttpControllerDelegate?
    
    fileprivate let noNetworkMsg: String = "Please check your internet connection or try again later"
    
    func post(path: String, parameter: Parameters, tag: Int) {
        print("full url: \(path) \(parameter)")
        
        if !Reachability.isConnectedToNetwork() {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.displayAlertFailed(title: "Network Error", message: noNetworkMsg)
            }
            return
        }
        
        SVProgressHUD.show()
        
        Alamofire.request(path, method: .post, parameters: parameter).validate().responseJSON {
            (response) in
            print(response.result.value ?? "")
            SVProgressHUD.dismiss()
            
            switch response.result {
            case .success(_):
                if let valueArray = response.result.value as? [String: Any] {
                    self.delegate?.receivedResponseArray(valueArray, tag: tag)
                    return
                }
                
            case .failure(_):
                self.delegate?.receivedErrorWithMessage("Something error please try again")
            }
        }
    }
    
    func get(path: String, parameter: Parameters, tag: Int) {
        print("full url: \(path) \(parameter)")
        
        if !Reachability.isConnectedToNetwork() {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.displayAlertFailed(title: "Network Error", message: noNetworkMsg)
            }
            return
        }
        
        SVProgressHUD.show()
        
        let headers = [
            "Content-Type": "application/json"
        ]

        Alamofire.request(path, method: .get, parameters: parameter, headers: headers).validate().responseJSON {
            (response) in
            print(response.result.value ?? "")
            SVProgressHUD.dismiss()
            
            switch response.result {
            case .success(_):
                if let valueArray = response.result.value as? [String: Any] {
                    self.delegate?.receivedResponseArray(valueArray, tag: tag)
                    return
                }
                
            case .failure(_):
                self.delegate?.receivedErrorWithMessage("Something error please try again")
            }
        }
    }
}

