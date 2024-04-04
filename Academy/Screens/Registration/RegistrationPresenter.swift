//
//  RegistrationPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class RegistrationPresenter {
    weak var view: RegistrationViewInput?
    var router: RegistrationRouterInput!
    var interactor: RegistrationInteractorInput!
    var moduleInput: RegistrationModuleInput?
    weak var moduleOutput: RegistrationModuleOutput?
    
    init() {
        
    }
}

extension RegistrationPresenter: RegistrationViewOutput {
    func validateFields() {
        interactor.startValidate()
    }
    
    func saveNameFieldText(name: String) {
        interactor.setName(name: name)
    }
    
    func saveAbilitiesFieldText(abilities: String) {
        interactor.setAbilities(abilities: abilities)
    }
    
    func saveEmailFieldText(email: String) {
        interactor.setEmail(email: email)
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        view?.setScreenTitle(with: interactor.getScreenTitle)
        router.setTransitionHandler(navigation)
        interactor.configureModels()
        interactor.setEmail(email: moduleInput!.email)
        interactor.setEmailInCell()
    }
}

extension RegistrationPresenter: RegistrationInteractorOutput {
    func didReceived(model: CellModel, index: Int) {
        view?.setModel(model: model, index: index)
    }
    
    
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
