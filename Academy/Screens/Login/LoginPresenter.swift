//
//  LoginPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class LoginPresenter {
    weak var view: LoginViewInput?
    var router: LoginRouterInput!
    var interactor: LoginInteractorInput!
    var moduleInput: LoginModuleInput?
    weak var moduleOutput: LoginModuleOutput?
    
    init() {
        
    }
}

extension LoginPresenter: LoginViewOutput {
    func tappedResetButton() {
        interactor.resetPassword()
    }
    
    func savePasswordFieldText(password: String) {
        interactor.setPassword(password: password)
    }
    
    func submitTapped() {
        interactor.validatePassword()
    }
    
    func saveEmailFieldText(email: String) {
        interactor.setEmail(text: email)
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        view?.setScreenTitle(with: interactor.getScreenTitle)
        router.setTransitionHandler(navigation)
        interactor.setEmail(text: moduleInput!.email)
        interactor.setName(text: moduleInput!.name)
        interactor.setSocial(text: moduleInput!.social)
        interactor.configureModels()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    func goToNextScreen() {
        router.goToNextScreen()
    }
    
    func didReceived(model: CellModel, index: Int) {
        view?.setModel(model: model, index: index)
    }
    
    func goToRegistration(email: String) {
        router.goToRegistrationScreen(email: email)
    }
    
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
