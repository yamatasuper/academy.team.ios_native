//
//  TabsController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class TabsController: UITabBarController, UITabBarControllerDelegate {
    @IBOutlet weak var tabBarElement: UITabBar?
    
    var output: TabsViewOutput!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let coursesViewController = CoursesViewContainer.assemble(with: CoursesViewControllerInput(moduleOutput: nil)).viewController
        coursesViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon-courses"), tag: 0)
        coursesViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        
        let myCoursesController = MyCoursesContainer.assemble(with: MyCoursesInput(moduleOutput: nil)).viewController
        myCoursesController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon-personal"), tag: 2)
        myCoursesController.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        let faqViewController = FaqContainer.assemble(with: FaqInput(moduleOutput: nil)).viewController
        faqViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon-faq"), tag: 1)
        faqViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        let aboutController = AboutContainer.assemble(with: AboutInput(moduleOutput: nil)).viewController
        aboutController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "icon-m"), tag: 2)
        aboutController.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        viewControllers = [
            coursesViewController.withNavigation() 
            , myCoursesController.withNavigation()
            , faqViewController.withNavigation()
            , aboutController.withNavigation()
        ]
        
    }
}

extension TabsController: TabsViewInput {
    func hideNavBar() {
    }
}

extension UIViewController {
    func withNavigation() -> UINavigationController {
        return UINavigationController.init(rootViewController: self)
    }
}
