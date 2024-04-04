//
//  AuthPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

final class AuthPresenter {
    weak var view: AuthViewInput?
    var router: AuthRouterInput!
    var interactor: AuthInteractorInput!
    var moduleInput: AuthModuleInput?
    weak var moduleOutput: AuthModuleOutput?
    
    init() {
        
    }
}

extension AuthPresenter: AuthViewOutput {
    func goToTabScreen() {
        router.goToTabScreen()
    }
    
    func goValidateEmail() {
        interactor.checkUserReguest()
    }
    
    func saveEmailFieldText(email: String) {
        interactor.setEmail(email: email)
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        router.setTransitionHandler(navigation)
        interactor.configureModels()
    }
}

extension AuthPresenter: AuthInteractorOutput {
    func goToLogin(email: String, name: String, social: String) {
        router.goToLoginScreen(email: email, name: name, social: social)
    }
    
    func goToRegistration(email: String) {
        router.goToRegistrationScreen(email: email)
    }
    
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
