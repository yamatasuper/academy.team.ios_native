//
//  LoginContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class LoginContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: LoginRouterInput!
    
    class func assemble(with input: LoginModuleInput) -> LoginContainer {
        let controller = LoginController()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        let interactor = LoginInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return LoginContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: LoginRouterInput) {
        viewController = view
        self.router = router
    }
}

class LoginInput: LoginModuleInput {
    weak var moduleOutput: LoginModuleOutput?
    var email: String = ""
    var name: String = ""
    var social: String = ""
    
    init(moduleOutput: LoginModuleOutput?, email: String, name: String, social: String) {
        self.moduleOutput = moduleOutput
        self.email = email
        self.name = name
        self.social = social
    }
}
