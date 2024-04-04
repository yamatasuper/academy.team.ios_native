//
//  AuthProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol AuthModuleInput {
    var moduleOutput: AuthModuleOutput? { get }
    var isStart: Bool { get }
}

// Выходные данные (и делегаты) модуля
protocol AuthModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol AuthViewInput: AnyObject {
    func setData(models: [CellModel])
    func setScreenTitle(with title: String)
}

// Передача событий от View к Presenter`у
protocol AuthViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func saveEmailFieldText(email: String)
    func goValidateEmail()
    func goToTabScreen()
}

// Управление Presenter от Interactor`ом
protocol AuthInteractorInput: AnyObject {
    func configureModels()
    func setEmail(email: String)
    func checkUserReguest()
}

// Передача данных от Interactor к Presenter`у
protocol AuthInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
    func goToRegistration(email: String)
    func goToLogin(email: String, name: String, social: String)
}

// Навигация / межмодульное взаимодействие
protocol AuthRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
    func goToRegistrationScreen(email: String)
    func goToLoginScreen(email: String, name: String, social: String)
    func goToTabScreen()
    func goToCoursesScreen()
}
