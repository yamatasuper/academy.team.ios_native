//
//  FaqController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class FaqController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonBottomConstraint:NSLayoutConstraint!
    @IBOutlet weak var formButton: UIButton!
    @IBOutlet weak var formButtonConstraint: NSLayoutConstraint!
    
    var tableManager: FaqTableViewManager!
    var output: FaqViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableManager = FaqTableViewManager(tableView: tableView)
        tableManager.output = output
        output.didViewLoad(navigationController)
        
        registerShowHideKeyboard()
    }
    @IBAction func formButtonTapped(_ sender: UIButton) {
        output.goToFormScreen()
    }
}

extension FaqController: FaqViewInput {
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

extension FaqController: KeyboardListener {
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

extension UIColor {

    /// Converts this `UIColor` instance to a 1x1 `UIImage` instance and returns it.
    ///
    /// - Returns: `self` as a 1x1 `UIImage`.
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 4, height: 4))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 4, height: 4))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}
