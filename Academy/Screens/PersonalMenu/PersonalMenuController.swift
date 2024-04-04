//
//  PersonalMenuController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class PersonalMenuController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonBottomConstraint:NSLayoutConstraint!
    
    var tableManager: PersonalMenuTableViewManager!
    var output: PersonalMenuViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableManager = PersonalMenuTableViewManager(tableView: tableView)
        tableManager.output = output
        
        output.didViewLoad(navigationController)
        registerShowHideKeyboard()
    }
}

extension PersonalMenuController: PersonalMenuViewInput {
    func setScreenTitle(with title: String) {
        self.navigationItem.title = title
    }
    
    func setData(models: [CellModel]) {
        tableManager.setModels(models)
    }
}

extension PersonalMenuController: KeyboardListener {
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
