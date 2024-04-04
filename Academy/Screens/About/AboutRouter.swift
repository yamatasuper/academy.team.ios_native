//
//  AboutRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class AboutRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension AboutRouter: AboutRouterInput {
    func goToTabScreen() {
        let vc = TabsContainer.assemble(with: TabsInput(moduleOutput: nil)).viewController
        transitionHandler?.pushViewController(vc, animated: true)
    }
    
    func goToLoginScreen(email: String) {
    }
    
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }
    func goToRegistrationScreen(email: String) {
        let vc = RegistrationContainer.assemble(with: RegistrationInput(moduleOutput: nil, email: email)).viewController
        transitionHandler?.pushViewController(vc, animated: true)
    }
}
