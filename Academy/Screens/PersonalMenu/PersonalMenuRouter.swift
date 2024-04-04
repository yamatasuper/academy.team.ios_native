//
//  PersonalMenuRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class PersonalMenuRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension PersonalMenuRouter: PersonalMenuRouterInput {
    func goToStartApp() {
        transitionHandler?.dismiss(animated: true, completion: nil)//popToRootViewController(animated: true)
    }
    
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
