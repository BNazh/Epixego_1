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
    
    private let noNetworkMsg: String = "Please check your internet connection or try again later"
    private let somethingWrong: String = "Something error please try again"
    
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
        let header: [String: String] = ["Content-Type": "application/json"]

        Alamofire.request(path, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header).validate().responseJSON {
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
                self.delegate?.receivedErrorWithMessage(self.somethingWrong)
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
        
        let header: [String: String] = ["Content-Type": "application/json"]

        Alamofire.request(path, method: .get, parameters: parameter, headers: header).validate().responseJSON {
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
                self.delegate?.receivedErrorWithMessage(self.somethingWrong)
            }
        }
    }
    
    func put(path: String, parameter: Parameters, tag: Int) {
        print("path:\(path) param:\(parameter)")
        
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
        let header: [String: String] = ["Content-Type": "application/json"]
        
        Alamofire.request(path, method: .put, parameters: parameter, encoding: JSONEncoding.default, headers: header).validate().responseJSON { (response) in
            print(response.result.value ?? "")
            
            SVProgressHUD.dismiss()
            
            switch response.result {
            case .success(_):
                if let valueArray = response.result.value as? [String: Any] {
                    self.delegate?.receivedResponseArray(valueArray, tag: tag)
                    return
                }
            case .failure(_):
                print(response.error)
                self.delegate?.receivedErrorWithMessage(self.somethingWrong)
            }
        }
    }
    
    func uploadImage(path: String, image: UIImage, tag: Int) {

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
        let imgData = image.jpegData(compressionQuality: 0.1)
        
        let parameters = ["name": "file"]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imgData!, withName: "file",fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        } , to:path, method: .post)
        { (result) in
            SVProgressHUD.dismiss()

            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    if let valueArray = response.result.value as? [String: Any] {
                        self.delegate?.receivedResponseArray(valueArray, tag: tag)
                        return
                    }
                }
                
            case .failure(let encodingError):
                print(encodingError)
                self.delegate?.receivedErrorWithMessage(self.somethingWrong)
            }
        }
    }
}

