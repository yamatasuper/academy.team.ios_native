//
//  TabsContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class TabsContainer: NSObject {
    let viewController: UITabBarController
    private(set) weak var router: TabsRouterInput!
    
    class func assemble(with input: TabsModuleInput) -> TabsContainer {
        let controller = TabsController()
        let presenter = TabsPresenter()
        let router = TabsRouter()
        
        let interactor = TabsInteractor()
        
        controller.output = presenter
        
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        presenter.moduleInput = input
        presenter.moduleOutput = input.moduleOutput
        
        interactor.output = presenter
        
        return TabsContainer(view: controller, router: router)
    }
    
    init(view: UITabBarController, router: TabsRouterInput) {
        viewController = view
        self.router = router
    }
}

class TabsInput: TabsModuleInput {
    weak var moduleOutput: TabsModuleOutput?
    
    init(moduleOutput: TabsModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}
