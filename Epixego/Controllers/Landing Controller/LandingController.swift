//
//  LandingController.swift
//  Epixego
//
//  Created by Moath Yahia on 7/5/19.
//  Copyright © 2019 Moath Yahia. All rights reserved.
//

import UIKit
import SideMenu
import JJFloatingActionButton

@available(iOS 11.0, *)
class LandingController: UIViewController {
    
    @IBOutlet weak var peopleBtn: UIButton!
    @IBOutlet weak var peopleContainerView: UIView!
    @IBOutlet weak var internshipContainerView: UIView!
    @IBOutlet weak var peopleUnderlineImg: UIImageView!
    @IBOutlet weak var internshipUnderlineImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupFloatingButton()
    }
    
    func setupView() {        
        hiddenViews(flag: true)

        CustomDesign.setBackgroundImage(view: self.view)
        
        SideMenuManager.default.menuLeftNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuAnimationFadeStrength = 0.7
    }
    
    @IBAction func peopleBtn(sender: UIButton) {
        hiddenViews(flag: true)
    }

    @IBAction func internshipBtn(sender: UIButton) {
        hiddenViews(flag: false)
    }
    
    fileprivate func hiddenViews(flag: Bool) {
        
        peopleContainerView.isHidden = !flag
        internshipContainerView.isHidden = flag
        
        peopleUnderlineImg.isHidden = !flag
        internshipUnderlineImg.isHidden = flag
    }
    
    @IBAction func sidebarBtn(sender: UIBarButtonItem) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @available(iOS 11.0, *)
    fileprivate func setupFloatingButton() {
        let actionButton = JJFloatingActionButton()
        
        actionButton.addItem(title: "Login in", image: UIImage(named: "First")?.withRenderingMode(.alwaysTemplate)) { item in
            // do something
        }
        
        actionButton.addItem(title: "Sign up", image: UIImage(named: "Second")?.withRenderingMode(.alwaysTemplate)) { item in
            // do something
        }
        
        actionButton.addItem(title: "For Employer", image: nil) { item in
            let storyboard = UIStoryboard(name: "EmployeerStoryboard", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: ConstantControllers.landingEmployerController)
            let navigation = UINavigationController(rootViewController: controller)
            self.present(navigation, animated: true, completion: nil)
        }
        
       actionButton.display(inViewController: self)
    }
}
