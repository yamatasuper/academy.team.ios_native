//
//  FaqRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class FaqRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension FaqRouter: FaqRouterInput {
    func popFormScreen() {
        let vc = FormQuestionContainer.assemble(with: FormQuestionInput(moduleOutput: nil)).viewController
        transitionHandler?.present(vc, animated: true, completion: nil)
    }
    
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }
}
