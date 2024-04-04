//
//  AboutProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 10/01/2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol AboutModuleInput {
    var moduleOutput: AboutModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
protocol AboutModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol AboutViewInput: AnyObject {
    func setData(models: [CellModel])
    func toggleVisibilityLogo(status: Bool)
    func setScreenTitle(with title: String)
}

// Передача событий от View к Presenter`у
protocol AboutViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func toggleLogo(status: Bool)
}

// Управление Presenter от Interactor`ом
protocol AboutInteractorInput: AnyObject {
    func configureModels()
    var getScreenTitle: String { get }
}

// Передача данных от Interactor к Presenter`у
protocol AboutInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
}

// Навигация / межмодульное взаимодействие
protocol AboutRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
}
