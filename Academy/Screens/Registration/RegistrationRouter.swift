//
//  RegistrationRouter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class RegistrationRouter {
    private(set) weak var transitionHandler: TransitionHandlerProtocol?
}

extension RegistrationRouter: RegistrationRouterInput {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?) {
        self.transitionHandler = transitionHandler
    }
}
