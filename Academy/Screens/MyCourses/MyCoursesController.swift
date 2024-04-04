//
//  MyCoursesController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class MyCoursesController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonBottomConstraint:NSLayoutConstraint!
    
    var tabBarTag: Bool = true
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if tabBarTag == true {
            self.tabBarController?.tabBar.tintColor = UIColor.init(red: 15/255, green: 207/255, blue: 106/255, alpha: 1)
        } else {
            self.tabBarController?.tabBar.tintColor = UIColor.gray
        }
    }
    
    var tableManager: MyCoursesTableViewManager!
    var output: MyCoursesViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 40, height: 40)
        menuBtn.setImage(UIImage(named:"adjust")!.withRenderingMode(.alwaysTemplate), for: .normal)
        menuBtn.tintColor = UIColor.black
        menuBtn.addTarget(self, action: #selector(clickRightButton), for: UIControl.Event.touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 25)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 25)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = menuBarItem
        
        tableManager = MyCoursesTableViewManager(tableView: tableView)
        tableManager.output = output
        
        output.didViewLoad(self.tabBarController?.navigationController)
    }
    
    @objc func clickRightButton() {
        output?.showMenu()
    }
}

extension MyCoursesController: MyCoursesViewInput {
    func setScreenTitle(with title: String) {
        self.navigationItem.title = title
    }
    func setModel(model: CellModel, index: Int) {
        tableManager.setModel(model, index: index)
    }
    func setData(models: [CellModel]) {
        tableManager.setModels(models)
    }
}
