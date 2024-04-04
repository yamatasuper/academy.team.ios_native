//
//  FormQuestionRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class FormQuestionRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension FormQuestionRouter: FormQuestionRouterInput {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }
}
