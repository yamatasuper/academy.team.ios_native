//
//  PersonalMenuPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class PersonalMenuPresenter {
    weak var view: PersonalMenuViewInput?
    var router: PersonalMenuRouterInput!
    var interactor: PersonalMenuInteractorInput!
    var moduleInput: PersonalMenuModuleInput?
    weak var moduleOutput: PersonalMenuModuleOutput?
    
    init() {
        
    }
}

extension PersonalMenuPresenter: PersonalMenuViewOutput {
    func menuLinkTapped(tag: Int) {
        interactor.directionSelection(tag: tag)
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        view?.setScreenTitle(with: interactor.getScreenTitle)
        router.setTransitionHandler(navigation)
        interactor.configureModels()
    }
}

extension PersonalMenuPresenter: PersonalMenuInteractorOutput {
    func goToAuthScreen() {
        router.goToStartApp()
    }
    
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
