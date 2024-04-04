//
//  AboutContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class AboutContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: AboutRouterInput!
    
    class func assemble(with input: AboutModuleInput) -> AboutContainer {
        let controller = AboutController()
        let presenter = AboutPresenter()
        let router = AboutRouter()
        
        let interactor = AboutInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return AboutContainer(view: controller, router: router)
    }
    
    init(view: UIViewController, router: AboutRouterInput) {
        viewController = view
        self.router = router
    }
}

class AboutInput: AboutModuleInput {
    weak var moduleOutput: AboutModuleOutput?
    
    init(moduleOutput: AboutModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}

