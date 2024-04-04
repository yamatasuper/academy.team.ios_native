//
//  PersonalMenuProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol PersonalMenuModuleInput {
    var moduleOutput: PersonalMenuModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
protocol PersonalMenuModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol PersonalMenuViewInput: AnyObject {
    func setData(models: [CellModel])
    func setScreenTitle(with title: String)
}

// Передача событий от View к Presenter`у
protocol PersonalMenuViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func menuLinkTapped(tag: Int)
}

// Управление Presenter от Interactor`ом
protocol PersonalMenuInteractorInput: AnyObject {
    func configureModels()
    var getScreenTitle: String { get }
    func directionSelection(tag: Int)
}

// Передача данных от Interactor к Presenter`у
protocol PersonalMenuInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
    func goToAuthScreen()
}

// Навигация / межмодульное взаимодействие
protocol PersonalMenuRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
    func goToStartApp()
}
