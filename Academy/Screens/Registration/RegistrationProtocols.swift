//
//  RegistrationProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol RegistrationModuleInput {
    var moduleOutput: RegistrationModuleOutput? { get }
    var email: String { get }
}

// Выходные данные (и делегаты) модуля
protocol RegistrationModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol RegistrationViewInput: AnyObject {
    func setData(models: [CellModel])
    func setModel(model: CellModel, index: Int)
    func setScreenTitle(with title: String)
}

// Передача событий от View к Presenter`у
protocol RegistrationViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func saveEmailFieldText(email: String)
    func saveNameFieldText(name: String)
    func saveAbilitiesFieldText(abilities: String)
    func validateFields()
}

// Управление Presenter от Interactor`ом
protocol RegistrationInteractorInput: AnyObject {
    var getScreenTitle: String { get }
    func configureModels()
    func setEmail(email: String)
    func setEmailInCell()
    func setName(name: String)
    func setAbilities(abilities: String)
    func startValidate()
}

// Передача данных от Interactor к Presenter`у
protocol RegistrationInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
    func didReceived(model: CellModel, index: Int)
}

// Навигация / межмодульное взаимодействие
protocol RegistrationRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
}
