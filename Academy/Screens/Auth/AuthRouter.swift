//
//  AuthRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class AuthRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension AuthRouter: AuthRouterInput {
    func goToLoginScreen(email: String, name: String, social: String) {
        let vc = LoginContainer.assemble(with: LoginInput(moduleOutput: nil, email: email, name: name, social: social)).viewController
        transitionHandler?.popToRootViewController(animated: true)
        transitionHandler?.pushViewController(vc, animated: true)
    }
    
    func goToCoursesScreen() {
        let vc = CoursesViewContainer.assemble(with: CoursesViewControllerInput(moduleOutput: nil)).viewController
        transitionHandler?.popToRootViewController(animated: true)
        transitionHandler?.pushViewController(vc, animated: true)
    }
    
    func goToTabScreen() {
        let vc = TabsContainer.assemble(with: TabsInput(moduleOutput: nil)).viewController
        transitionHandler?.popToRootViewController(animated: true)
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
