//
//  FormQuestionProtocols.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit

// Входные параметры модуля
protocol FormQuestionModuleInput {
    var moduleOutput: FormQuestionModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
protocol FormQuestionModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol FormQuestionViewInput: AnyObject {
    func setData(models: [CellModel])
    func setModel(model: CellModel, index: Int)
}

// Передача событий от View к Presenter`у
protocol FormQuestionViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func buttonSubmit()
    func emailChanged(text: String)
    func nameChanged(text: String)
    func textChanged(text: String)
}

// Управление Presenter от Interactor`ом
protocol FormQuestionInteractorInput: AnyObject {
    var getScreenTitle: String { get }
    func configureModels()
    func validateField()
    func setEmail(text: String)
    func setName(text: String)
    func setQuestion(text: String)
}

// Передача данных от Interactor к Presenter`у
protocol FormQuestionInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
    func didReceived(model: CellModel, index: Int)
}

// Навигация / межмодульное взаимодействие
protocol FormQuestionRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
}
