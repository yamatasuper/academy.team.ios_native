//
//  RegistrationContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class RegistrationContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: RegistrationRouterInput!
    
    class func assemble(with input: RegistrationModuleInput) -> RegistrationContainer {
        let controller = RegistrationController()
        let presenter = RegistrationPresenter()
        let router = RegistrationRouter()
        
        let interactor = RegistrationInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return RegistrationContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: RegistrationRouterInput) {
        viewController = view
        self.router = router
    }
}

class RegistrationInput: RegistrationModuleInput {
    weak var moduleOutput: RegistrationModuleOutput?
    var email: String
    
    init(moduleOutput: RegistrationModuleOutput?, email: String) {
        self.moduleOutput = moduleOutput
        self.email = email
    }
}

