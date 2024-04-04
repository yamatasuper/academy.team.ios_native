//
//  FormQuestionPresenter.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class FormQuestionPresenter {
    weak var view: FormQuestionViewInput?
    var router: FormQuestionRouterInput!
    var interactor: FormQuestionInteractorInput!
    var moduleInput: FormQuestionModuleInput?
    weak var moduleOutput: FormQuestionModuleOutput?
    
    init() {
        
    }
}

extension FormQuestionPresenter: FormQuestionViewOutput {
    func emailChanged(text: String) {
        interactor.setEmail(text: text)
    }
    
    func nameChanged(text: String) {
        interactor.setName(text: text)
    }
    
    func textChanged(text: String) {
        interactor.setQuestion(text: text)
    }
    
    func buttonSubmit() {
        interactor.validateField()
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        router.setTransitionHandler(navigation)
        interactor.configureModels()
    }
}

extension FormQuestionPresenter: FormQuestionInteractorOutput {
    func didReceived(model: CellModel, index: Int) {
        view?.setModel(model: model, index: index)
    }
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
