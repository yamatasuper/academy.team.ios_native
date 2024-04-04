//
//  MainNavigationController.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    var preloaderView: UIView? = nil
    var output: MainNavigationViewOutput?
    var toastY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventsListening()
        self.setNavigationBarHidden(true, animated: true)
        
        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.backgroundColor = UIColor.black
        self.navigationBar.isTranslucent = true
//        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationBar.shadowImage = UIImage()
//        self.view.backgroundColor = UIColor.clear
//        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        MainNavigationContainer.assemble(vc: self)
        output?.didViewLoad(self)
        
        registerShowHideKeyboard()
        self.toastY = self.view.frame.size.height-100
    }
    
    func registerEventOnMainThread<K>(_ event: Events, handler: @escaping (K?) -> Void) {
        EventBus.onMainThread(self, name: event.getEventTag()) { result in
            handler(result?.object as? K)
        }
    }
    
    func eventsListening() {
        registerEventOnMainThread(Events.MessageEvent) { (message: String?) in
            if let message = message {
                self.showMessage(message)
            }
        }
        registerEventOnMainThread(Events.ShowLoader) { (_: Void?) in
            self.showLoader()
        }
        registerEventOnMainThread(Events.HideLoader) { (_: Void?) in
            self.hideLoader()
        }
        registerEventOnMainThread(Events.UnauthEvent) { (_: Void?) in
//            self.removeUserData()
//            UIViewController.Protek.AuthLoginViewController.showAsRoot()
        }
    }
}

extension MainNavigationController: MainNavigationViewInput {
    
}

extension MainNavigationController: KeyboardListener {
    func keyboardShow(keyboardHeight: CGFloat) {
        toastY = self.view.frame.size.height - 100 - keyboardHeight
    }
    
    func keyboardHide() {
        toastY = self.view.frame.size.height - 100
    }
}

extension MainNavigationController {
    func showMessage(_ message: String) {
        showToast(message: message)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if let loaderFrame = preloaderView?.frame {
            if UIDevice.current.orientation.isLandscape {
                let frame = CGRect.init(x: 0, y: 0, width: loaderFrame.height, height: loaderFrame.width)
                preloaderView?.frame = frame
            } else {
                let frame = CGRect.init(x: 0, y: 0, width: loaderFrame.height, height: loaderFrame.width)
                preloaderView?.frame = frame
            }
        }
    }
    
    func showLoader() {
        if let loaderView = preloaderView {
            hideLoader()
            showLoader()
        } else {
            let loaderView = UIView.init(frame: self.view.frame)
            
//            let gradientRingLayer = WCGraintCircleLayer(bounds: CGRect(origin: CGPoint.zero,size:CGSize(width: 150, height: 150)), position:CGPoint(x: 200, y: 300),fromColor:UIColor.blue, toColor:UIColor.white, linewidth:4.0, toValue:0)
//            loaderView.layer.addSublayer(gradientRingLayer)
//            let duration = 3.0
//            gradientRingLayer.animateCircleTo(duration: duration, fromValue: 0, toValue: 1)
//
            loaderView.center = self.view.center;
            let backgroundColor = UIColor.init(red:216/255.0, green:216/255.0, blue:216/255.0, alpha:0.45);
            loaderView.backgroundColor = backgroundColor
            preloaderView = loaderView
            view.addSubview(loaderView)
            loaderView.bringSubviewToFront(self.view)
            //KVSpinnerView.show(on: loaderView)
        }
    }
    
    func hideLoader() {
        preloaderView?.removeFromSuperview()
        preloaderView = nil
    }
    
    private func showToast(message : String) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.init(red:11/255.0, green:207/255.0, blue:107/255.0, alpha:0.6);
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 17.5;
        toastLabel.clipsToBounds = true
        
        let font: UIFont = UIFont.systemFont(ofSize: 14.0)
        toastLabel.font = font
        let fontAttributes = [NSAttributedString.Key.font: font]
        let stringBoundingBox = (message as NSString).size(withAttributes: fontAttributes);
        let xPosition: CGFloat = max(10, self.view.frame.size.width/2 - stringBoundingBox.width/2 - 5)
        let widthToast: CGFloat = min(stringBoundingBox.width + 10, self.view.frame.width - 20)
        toastLabel.frame = CGRect(x: xPosition, y: toastY, width: widthToast, height: 35)
                
        //self.view.addSubview(toastLabel)
        // toastLabel.bringSubviewToFront(window.root)
        
        if let window:UIWindow = UIApplication.shared.windows.first! {
            window.addSubview(toastLabel)
        }
        
        UIView.animate(withDuration: 4.0, delay: 2, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
