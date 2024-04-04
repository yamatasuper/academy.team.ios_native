//
//  MyCoursesRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class MyCoursesRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension MyCoursesRouter: MyCoursesRouterInput {
    func goToMenuScreen() {
        let vc = PersonalMenuContainer.assemble(with: PersonalMenuInput(moduleOutput: nil)).viewController
        transitionHandler?.present(vc, animated: true, completion: nil)
    }
    
    func goToAuthScreen() {
        transitionHandler?.popToRootViewController(animated: true)
    }
    
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }
}
