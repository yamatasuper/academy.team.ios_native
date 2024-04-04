//
//  LoginRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class LoginRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension LoginRouter: LoginRouterInput {
    func goToNextScreen() {
        let vc = TabsContainer.assemble(with: TabsInput(moduleOutput: nil)).viewController
        transitionHandler?.pushViewController(vc, animated: true)
    }
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }
    func goToRegistrationScreen(email: String) {
        let vc = RegistrationContainer.assemble(with: RegistrationInput(moduleOutput: nil, email: email)).viewController
        transitionHandler?.pushViewController(vc, animated: true)
    }
}
