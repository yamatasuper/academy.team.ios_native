//
//  LoginController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonBottomConstraint:NSLayoutConstraint!
    
    var tableManager: LoginTableViewManager!
    var output: LoginViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "main_header_bg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        tableManager = LoginTableViewManager(tableView: tableView)
        tableManager.output = output
        
        output.didViewLoad(navigationController)
        registerShowHideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension LoginController: LoginViewInput {
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

extension LoginController: KeyboardListener {
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
