//
//  PreRegistrationRouter.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class PreRegistrationRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension PreRegistrationRouter: PreRegistrationRouterInput {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }
}
