//
//  MainNavigationProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol MainNavigationModuleInput {
    var moduleOutput: MainNavigationModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
protocol MainNavigationModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol MainNavigationViewInput: AnyObject {
}

// Передача событий от View к Presenter`у
protocol MainNavigationViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
}

// Управление Presenter от Interactor`ом
protocol MainNavigationInteractorInput: AnyObject {
    func checkAuth()
}

// Передача данных от Interactor к Presenter`у
protocol MainNavigationInteractorOutput: AnyObject {
    func goToNextScreen()
    func goToAuthScreen()
}

// Навигация / межмодульное взаимодействие
protocol MainNavigationRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
    func goToAuthScreen()
    func goToTabsScreen()
}
