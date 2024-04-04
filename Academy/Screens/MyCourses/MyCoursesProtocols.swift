//
//  MyCoursesProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol MyCoursesModuleInput {
    var moduleOutput: MyCoursesModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
protocol MyCoursesModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol MyCoursesViewInput: AnyObject {
    func setData(models: [CellModel])
    func setModel(model: CellModel, index: Int)
    func setScreenTitle(with title: String)
}

// Передача событий от View к Presenter`у
protocol MyCoursesViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func showMenu()
}

// Управление Presenter от Interactor`ом
protocol MyCoursesInteractorInput: AnyObject {
    var getScreenTitle: String { get }
    func checkAuth()
}

// Передача данных от Interactor к Presenter`у
protocol MyCoursesInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
    func didReceived(model: CellModel, index: Int)
    func goToAuthScreen()
}

// Навигация / межмодульное взаимодействие
protocol MyCoursesRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
    func goToAuthScreen()
    func goToMenuScreen()
}
