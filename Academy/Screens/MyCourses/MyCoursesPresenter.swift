//
//  MyCoursesPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class MyCoursesPresenter {
    weak var view: MyCoursesViewInput?
    var router: MyCoursesRouterInput!
    var interactor: MyCoursesInteractorInput!
    var moduleInput: MyCoursesModuleInput?
    weak var moduleOutput: MyCoursesModuleOutput?
    
    init() {
        
    }
}

extension MyCoursesPresenter: MyCoursesViewOutput {
    func showMenu() {
        router.goToMenuScreen()
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        router.setTransitionHandler(navigation)
        view?.setScreenTitle(with: interactor.getScreenTitle)
        interactor.checkAuth()
    }
}

extension MyCoursesPresenter: MyCoursesInteractorOutput {
    func goToAuthScreen() {
        router.goToAuthScreen()
    }
    
    func didReceived(model: CellModel, index: Int) {
        view?.setModel(model: model, index: index)
    }
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
