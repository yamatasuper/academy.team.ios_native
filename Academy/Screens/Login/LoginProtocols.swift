//
//  LoginProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 14.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol LoginModuleInput {
    var moduleOutput: LoginModuleOutput? { get }
    var email: String { get }
    var name: String { get }
    var social: String { get }
}

// Выходные данные (и делегаты) модуля
protocol LoginModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol LoginViewInput: AnyObject {
    func setData(models: [CellModel])
    func setModel(model: CellModel, index: Int)
    func setScreenTitle(with title: String)
}

// Передача событий от View к Presenter`у
protocol LoginViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func saveEmailFieldText(email: String)
    func savePasswordFieldText(password: String)
    func submitTapped()
    func tappedResetButton()
}

// Управление Presenter от Interactor`ом
protocol LoginInteractorInput: AnyObject {
    var getScreenTitle: String { get }
    func configureModels()
    func setEmail(text: String)
    func setName(text: String)
    func setSocial(text: String)
    func setPassword(password: String)
    func validatePassword()
    func resetPassword()
}

// Передача данных от Interactor к Presenter`у
protocol LoginInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
    func didReceived(model: CellModel, index: Int)
    func goToNextScreen()
}

// Навигация / межмодульное взаимодействие
protocol LoginRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
    func goToRegistrationScreen(email: String)
    func goToNextScreen()
}
