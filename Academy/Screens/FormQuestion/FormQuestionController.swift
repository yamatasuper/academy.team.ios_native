//
//  FormQuestionController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class FormQuestionController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonBottomConstraint:NSLayoutConstraint!
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    var tableManager: FormQuestionTableViewManager!
    var output: FormQuestionViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableManager = FormQuestionTableViewManager(tableView: tableView)
        tableManager.output = output
        
        output.didViewLoad(self.tabBarController?.navigationController)
        registerShowHideKeyboard()
    }
}

extension FormQuestionController: FormQuestionViewInput {
    func setModel(model: CellModel, index: Int) {
        tableManager.setModel(model, index: index)
    }
    func setData(models: [CellModel]) {
        tableManager.setModels(models)
    }
}

extension FormQuestionController: KeyboardListener {
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
        
        self.buttonBottomConstraint.constant = -(keyboardHeight - safeAreaBottomInsert)
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
    }
}
