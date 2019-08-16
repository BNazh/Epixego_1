//
//  CustomDesign.swift
//  Epixego
//
//  Created by Moath Yahia on 7/16/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import Foundation
import UIKit

struct CustomDesign {
    
     static func customDesignView(view: UIView) {
        view.layer.cornerRadius = 6.0
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 2.0
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 6.0
        
    }
    
    static func setBackgroundImage(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        UIImage(named: "background-image")?.draw(in: view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        view.backgroundColor = UIColor(patternImage: image)
    }
    
    static func customAnyView(view: UIView, cornerRadius: CGFloat, cornerColor: UIColor? = nil, cornerWidth: CGFloat? = 0, shadowColor: UIColor? = nil, shadowRadius: CGFloat? = 0, shadowOpacity: Float? = 0.0) {
        
        view.layer.cornerRadius = cornerRadius
        view.layer.borderColor = cornerColor?.cgColor
        view.layer.borderWidth = cornerWidth ?? 0
        
        view.layer.shadowColor = shadowColor?.cgColor
        view.layer.shadowOpacity = shadowOpacity ?? 0.0
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = shadowRadius ?? 0.0
    }
}
