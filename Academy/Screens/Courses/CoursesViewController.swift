//
//  CoursesViewController.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//


import Foundation
import UIKit

class CoursesViewController: UIViewController {
    var output: CoursesViewOutput?
    var tableManager: CoursesViewManager?
    var flag: Bool = false
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var tableCourses: UITableView!
    @IBOutlet weak var hiddenTable: UITableView!
    @IBOutlet weak var registrationButton: UIButton!
    @IBAction func registrationAction(_ sender: Any) {
        
        output?.tapToPreliminary()
        
        
    }
    
    @IBOutlet weak var openEffect: UIVisualEffectView!
    
    @IBOutlet var animateView: UIView!
    
    var effect: UIVisualEffect!
    var tabBarTag: Bool = true
    var lastContentOffset: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableManager = CoursesViewManager(tableView: tableCourses, output: output!)
        
        tableCourses.separatorStyle = .none
        tableCourses.tableFooterView = UIView(frame: CGRect.zero)
        
        output?.didViewLoad(navigationController)
        tableCourses.isScrollEnabled = true
        test()
        
    }
    
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.layoutIfNeeded()
        if tabBarTag == true {
            self.tabBarController?.tabBar.tintColor = UIColor.init(red: 15/255, green: 207/255, blue: 106/255, alpha: 1)
        } else {
            self.tabBarController?.tabBar.tintColor = UIColor.gray
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension CoursesViewController: CoursesViewInput {
    func setModel(model: CellModel, row: Int) {
        tableManager!.set(model: model, row: row)
        tableCourses.reloadData()
    }
    
    func setData(models: [CellModel]) {
        tableManager?.set(models: models)
        tableCourses.reloadData()
    }
    
    func setScreenTitle(with title: String) {
        self.navigationItem.title = title
    }
}

extension CoursesViewController {
    func test() {
        
        tableManager?.tapClosure = { [weak self] flag in
            guard let `self` = self else { return }
            self.flag = flag
            
            switch self.flag {
            case true:
                self.registrationButton.isHidden = false
            case false:
                self.registrationButton.isHidden = true
            default:
                break
            }
        }
        
    }
}
