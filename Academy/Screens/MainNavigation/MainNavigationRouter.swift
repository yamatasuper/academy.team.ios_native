//
//  MainNavigationRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

final class MainNavigationRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension MainNavigationRouter: MainNavigationRouterInput {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }
    
    func goToAuthScreen() {
        let vc = AuthContainer.assemble(with: AuthInput(moduleOutput: nil, isStart: true)).viewController
        transitionHandler?.pushViewController(vc, animated: true)
    }
    
    func goToTabsScreen() {
        let vc = TabsContainer.assemble(with: TabsInput(moduleOutput: nil)).viewController
        transitionHandler?.popToRootViewController(animated: true)
        transitionHandler?.pushViewController(vc, animated: true)
    }
}
