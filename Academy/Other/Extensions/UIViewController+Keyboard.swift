//
//  UiViewController.swift
//  portal
//
//  Created by Василий Сомов on 27.11.2018.
//  Copyright © 2018 Василий Сомов. All rights reserved.
//

import Foundation
import UIKit

protocol KeyboardListener {
    func keyboardShow(keyboardHeight: CGFloat)
    func keyboardHide()
}

@objc protocol KeyboardListenerPrivate {
    func registerShowHideKeyboard()
    @objc func keyboardWillShow(notification: Notification)
    @objc func keyboardWillHide(notification: Notification)
}

extension UIViewController: KeyboardListenerPrivate {
    func registerShowHideKeyboard() {
        if(self is KeyboardListener) {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                                   name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
                                                   name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo:NSDictionary = notification.userInfo as! NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardHeight = keyboardFrame.cgRectValue.height
        (self as? KeyboardListener)?.keyboardShow(keyboardHeight: keyboardHeight)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        (self as? KeyboardListener)?.keyboardHide()
    }
}
