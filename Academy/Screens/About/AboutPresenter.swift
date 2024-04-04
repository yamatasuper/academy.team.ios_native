//
//  AboutPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class AboutPresenter {
    weak var view: AboutViewInput?
    var router: AboutRouterInput!
    var interactor: AboutInteractorInput!
    var moduleInput: AboutModuleInput?
    weak var moduleOutput: AboutModuleOutput?
    
    init() {
        
    }
}

extension AboutPresenter: AboutViewOutput {
    func toggleLogo(status: Bool) {
        view?.toggleVisibilityLogo(status: status)
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        view?.setScreenTitle(with: interactor.getScreenTitle)
        router.setTransitionHandler(navigation)
        interactor.configureModels()
    }
}

extension AboutPresenter: AboutInteractorOutput {
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
