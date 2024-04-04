//
//  PreRegistrationViewController.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

class PreRegistrationController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
     
    var tableManager: PreRegistrationManager!
    var output: PreRegistrationViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Предварительная регистрация"
        //let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        //self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        tableManager = PreRegistrationManager(tableView: tableView)
        tableManager.output = output
        
        output.didViewLoad(navigationController)
        
        self.hideKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
}

extension PreRegistrationController: PreRegistrationViewInput {

    func setModel(model: CellModel, index: Int) {
        tableManager.setModel(model, index: index)
    }
    func setData(models: [CellModel]) {
        tableManager.setModels(models)
    }
}

extension PreRegistrationController: UITextFieldDelegate {
    @objc func keyboardDidShow(notification: Notification) {
        
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.tableView.frame.origin.y == tableView.frame.origin.y {
                self.tableView.frame.origin.y -= 50
                UIView.animate(withDuration: 1, animations: {
                    self.tableView.frame = CGRect(x: 0, y: -130 ,width: 414, height: 800)
                }, completion: nil)
            }
        }
    }
    
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(PreRegistrationController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.5, animations: {
            self.tableView.frame = CGRect(x: 0, y: 25 ,width: 414, height: 800)
        }, completion: nil)
    }
    
}
