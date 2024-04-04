//
//  FaqProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol FaqModuleInput {
    var moduleOutput: FaqModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
protocol FaqModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol FaqViewInput: AnyObject {
    func setData(models: [CellModel])
    func setModel(model: CellModel, index: Int)
    func setScreenTitle(with title: String)
}

// Передача событий от View к Presenter`у
protocol FaqViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func questionTapped(pos: Int)
    func goToFormScreen()
}

// Управление Presenter от Interactor`ом
protocol FaqInteractorInput: AnyObject {
    var getScreenTitle: String { get }
    func configureModels()
    func didSelectItem(pos: Int)
}

// Передача данных от Interactor к Presenter`у
protocol FaqInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
    func didReceived(model: CellModel, index: Int)
}

// Навигация / межмодульное взаимодействие
protocol FaqRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
    func popFormScreen()
}
