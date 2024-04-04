//
//  Navigation.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

protocol TransitionHandlerProtocol: class {
    var viewControllers: [UIViewController] { get set }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func popToRootViewController(animated: Bool) -> [UIViewController]?
    
    func popViewController(animated: Bool)
    //    func popToRootViewController(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    
    var presentedViewController: UIViewController? { get }
    
    func present(alertController: UIAlertController, arrowDirections: UIPopoverArrowDirection, sourceView: UIView?, sourceRect: CGRect?)
    func present(activityController: UIActivityViewController, arrowDirections: UIPopoverArrowDirection, sourceView: UIView?, sourceRect: CGRect?)
}

extension UINavigationController: TransitionHandlerProtocol {
    func present(alertController: UIAlertController, arrowDirections: UIPopoverArrowDirection, sourceView: UIView?, sourceRect: CGRect?) {
        
    }
    
    func present(activityController: UIActivityViewController, arrowDirections: UIPopoverArrowDirection, sourceView: UIView?, sourceRect: CGRect?) {
        
    }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        pushViewController(viewController, animated: animated)
        guard let completion = completion else {
            return
        }
        guard animated, let coordinator = transitionCoordinator else {
            completion()
            return
        }
        coordinator.animate(alongsideTransition: nil) { _ in
            completion()
        }
    }
    
    func popViewController(animated: Bool) {
        let _: UIViewController? = popViewController(animated: animated)
    }
    //
    func popToRootViewController(animated: Bool) {
        self.dismiss(animated: true, completion: {});
        let _: [UIViewController]? = popToRootViewController(animated: animated)
    }
    //
    func popToViewController(_ viewController: UIViewController, animated: Bool) {
        let _: [UIViewController]? = popToViewController(viewController, animated: animated)
    }
}
//
//extension UIViewController {
//    func present(alertController: UIAlertController, arrowDirections: UIPopoverArrowDirection = [], sourceView: UIView? = nil, sourceRect: CGRect? = nil) {
//        guard alertController.preferredStyle == .actionSheet else {
//            present(alertController, animated: true, completion: nil)
//            return
//        }
//        guard let sourceView = sourceView, let sourceRect = sourceRect else {
//            fatalError("Arguments `sourceView` and `sourceRect` are required for UIAlertController with type `actionSheet`")
//        }
//        if UIDevice.current.iPad {
//            alertController.modalPresentationStyle = .popover
//            alertController.popoverPresentationController?.sourceView = sourceView
//            alertController.popoverPresentationController?.sourceRect = sourceRect
//            alertController.popoverPresentationController?.permittedArrowDirections = arrowDirections
//        }
//        present(alertController, animated: true, completion: nil)
//    }
//
//    func present(activityController: UIActivityViewController, arrowDirections: UIPopoverArrowDirection = [], sourceView: UIView? = nil, sourceRect: CGRect? = nil) {
//        guard let sourceView = sourceView, let sourceRect = sourceRect else {
//            fatalError("Arguments `sourceView` and `sourceRect` are required for UIActivityViewController")
//        }
//        if UIDevice.current.iPad {
//            activityController.modalPresentationStyle = .popover
//            activityController.popoverPresentationController?.sourceView = sourceView
//            activityController.popoverPresentationController?.sourceRect = sourceRect
//            activityController.popoverPresentationController?.permittedArrowDirections = arrowDirections
//        }
//        present(activityController, animated: true, completion: nil)
//    }
//}
