//
//  TabsProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol TabsModuleInput {
    var moduleOutput: TabsModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
protocol TabsModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol TabsViewInput: AnyObject {
    func hideNavBar()
}

// Передача событий от View к Presenter`у
protocol TabsViewOutput: AnyObject {
    func didViewLoad()
    func hideBar()
}

// Управление Presenter от Interactor`ом
protocol TabsInteractorInput: AnyObject {
}

// Передача данных от Interactor к Presenter`у
protocol TabsInteractorOutput: AnyObject {
}

// Навигация / межмодульное взаимодействие
protocol TabsRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
}
