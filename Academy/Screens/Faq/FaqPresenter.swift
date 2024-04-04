//
//  FaqPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class FaqPresenter {
    weak var view: FaqViewInput?
    var router: FaqRouterInput!
    var interactor: FaqInteractorInput!
    var moduleInput: FaqModuleInput?
    weak var moduleOutput: FaqModuleOutput?
    
    init() {
        
    }
}

extension FaqPresenter: FaqViewOutput {
    func goToFormScreen() {
        router.popFormScreen()
    }
    
    func questionTapped(pos: Int) {
        interactor.didSelectItem(pos: pos)
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        router.setTransitionHandler(navigation)
        view?.setScreenTitle(with: interactor.getScreenTitle)
        interactor.configureModels()
    }
}

extension FaqPresenter: FaqInteractorOutput {
    func didReceived(model: CellModel, index: Int) {
        view?.setModel(model: model, index: index)
    }
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
