//
//  UInavigationController+Constructor.swift
//  Academy
//
//  Created by Sergey Dimitriev on 05.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

protocol CustomNavigationBar {
    func setLogo()
    func setLeftItem()
    func setRightItem()
    func setTitle()
}

@objc protocol CustomNavigationBarPrivate {
    func registerCustomBar()
}

extension UIViewController : CustomNavigationBarPrivate {
    func registerCustomBar() {
        if(self is CustomNavigationBar) {
            (self as? CustomNavigationBar)?.setLogo()
        }
    }
    
//    @objc func keyboardWillShow(notification: Notification) {
//        let userInfo:NSDictionary = notification.userInfo as! NSDictionary
//        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
//        let keyboardHeight = keyboardFrame.cgRectValue.height
//        (self as? KeyboardListener)?.keyboardShow(keyboardHeight: keyboardHeight)
//    }
//
//    @objc func keyboardWillHide(notification: Notification) {
//        (self as? KeyboardListener)?.keyboardHide()
//    }
}
