//
//  MainNavigationContainer.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

final class MainNavigationContainer: NSObject {
    let viewController: UIViewController
    private(set) weak var router: MainNavigationRouterInput!
    
    class func assemble(vc: MainNavigationController) -> MainNavigationContainer {
        let presenter = MainNavigationPresenter()
        let router = MainNavigationRouter()
        
        let interactor = MainNavigationInteractor()
        
        vc.output = presenter
        
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
        
        return MainNavigationContainer(view: vc, router: router)
    }
    
    init(view: UIViewController, router: MainNavigationRouterInput) {
        viewController = view
        self.router = router
    }
}

class MainNavigationInput: MainNavigationModuleInput {
    weak var moduleOutput: MainNavigationModuleOutput?
    
    init(moduleOutput: MainNavigationModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}
