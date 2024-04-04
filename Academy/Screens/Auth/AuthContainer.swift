//
//  AuthContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class AuthContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: AuthRouterInput!
    
    class func assemble(with input: AuthModuleInput) -> AuthContainer {
        let controller = AuthController()
        let presenter = AuthPresenter()
        let router = AuthRouter()
        
        let interactor = AuthInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return AuthContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: AuthRouterInput) {
        viewController = view
        self.router = router
    }
}

class AuthInput: AuthModuleInput {
    weak var moduleOutput: AuthModuleOutput?
    var isStart: Bool = true
    
    init(moduleOutput: AuthModuleOutput?, isStart: Bool) {
        self.moduleOutput = moduleOutput
        self.isStart = isStart
    }
}

