//
//  PersonalMenuContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class PersonalMenuContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: PersonalMenuRouterInput!
    
    class func assemble(with input: PersonalMenuModuleInput) -> PersonalMenuContainer {
        let controller = PersonalMenuController()
        let presenter = PersonalMenuPresenter()
        let router = PersonalMenuRouter()
        
        let interactor = PersonalMenuInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return PersonalMenuContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: PersonalMenuRouterInput) {
        viewController = view
        self.router = router
    }
}

class PersonalMenuInput: PersonalMenuModuleInput {
    weak var moduleOutput: PersonalMenuModuleOutput?
    
    init(moduleOutput: PersonalMenuModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}

