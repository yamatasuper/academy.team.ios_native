//
//  FaqContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class FaqContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: FaqRouterInput!
    
    class func assemble(with input: FaqModuleInput) -> FaqContainer {
        let controller = FaqController()
        let presenter = FaqPresenter()
        let router = FaqRouter()
        
        let interactor = FaqInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return FaqContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: FaqRouterInput) {
        viewController = view
        self.router = router
    }
}

class FaqInput: FaqModuleInput {
    weak var moduleOutput: FaqModuleOutput?
    
    init(moduleOutput: FaqModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}
