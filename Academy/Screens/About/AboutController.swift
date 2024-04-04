//
//  AboutController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class AboutController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonBottomConstraint:NSLayoutConstraint!
    
    var tableManager: AboutTableViewManager!
    var output: AboutViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableManager = AboutTableViewManager(tableView: tableView)
        tableManager.output = output
        
        output.didViewLoad(navigationController)
        registerShowHideKeyboard()
        //registerCustomBar()
    }
}

extension AboutController: AboutViewInput {
    func setScreenTitle(with title: String) {
        self.navigationItem.title = title
    }
    
    func toggleVisibilityLogo(status: Bool) {
//        if let foundView = self.navigationController?.navigationBar.viewWithTag(199) {
//            if status {
//                self.setTitle()
//            }
//        } else if !status {
//            self.setLogo()
//        }
    }
    
    func setData(models: [CellModel]) {
        tableManager.setModels(models)
    }
}

extension AboutController: KeyboardListener {
    func keyboardHide() {
        self.buttonBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
    }
    
    func keyboardShow(keyboardHeight: CGFloat) {
        var safeAreaBottomInsert:CGFloat = 0.0
        if #available(iOS 11.0, *) {
            safeAreaBottomInsert = view.safeAreaInsets.bottom
        }
        
        self.buttonBottomConstraint.constant = keyboardHeight - safeAreaBottomInsert
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
    }
}
