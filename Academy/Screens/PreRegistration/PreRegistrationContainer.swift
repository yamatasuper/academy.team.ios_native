//
//  PreRegistrationContainer.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

final class PreRegistrationContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: PreRegistrationRouterInput!
    
    class func assemble(with input: PreRegistrationModuleInput) -> PreRegistrationContainer {
        let controller = PreRegistrationController()
        let presenter = PreRegistrationPresenter()
        let router = PreRegistrationRouter()
        
        let interactor = PreRegistrationInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return PreRegistrationContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: PreRegistrationRouterInput) {
        viewController = view
        self.router = router
    }
}

class PreRegistrationInput: PreRegistrationModuleInput {
    weak var moduleOutput: PreRegistrationModuleOutput?
    
    init(moduleOutput: PreRegistrationModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}
