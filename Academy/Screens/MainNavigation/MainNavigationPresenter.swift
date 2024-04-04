//
//  MainNavigationPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class MainNavigationPresenter {
    weak var view: MainNavigationViewInput?
    var router: MainNavigationRouterInput!
    var interactor: MainNavigationInteractorInput!
    var moduleInput: MainNavigationModuleInput?
    weak var moduleOutput: MainNavigationModuleOutput?
    
    init() {
        
    }
}

extension MainNavigationPresenter: MainNavigationViewOutput {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        router.setTransitionHandler(navigation)
        interactor.checkAuth()
    }
}

extension MainNavigationPresenter: MainNavigationInteractorOutput {
    func goToNextScreen() {
        router.goToTabsScreen()
    }
    
    func goToAuthScreen() {
        router.goToAuthScreen()
    }
}
