//
//  PreRegistrationPresenter.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class PreRegistrationPresenter {
    weak var view: PreRegistrationViewInput?
    var router: PreRegistrationRouterInput!
    var interactor: PreRegistrationInteractorInput!
    var moduleInput: PreRegistrationModuleInput?
    weak var moduleOutput: PreRegistrationModuleOutput?
    
    init() {
        
    }
}

extension PreRegistrationPresenter: PreRegistrationViewOutput {
    func questionTapped(pos: Int) {
        //interactor.didSelectItem(pos: pos)
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        router.setTransitionHandler(navigation)
        interactor.configureModels()
        interactor.loadListCourses()
    }
    
    
    func saveEmailFieldText(email: String) {
        interactor.setEmail(email: email)
    }
    
    func saveNameFieldText(userName: String) {
        interactor.setUserName(userName: userName)
    }
    
    func saveUniversityFieldText(universityName: String) {
        interactor.setUniversityName(universityName: universityName)
    }
    
    func saveScheduleText(schedule: String) {
        interactor.setScheduleName(schedule: schedule)
    }
    
    func goValidateEmail() {
        interactor.checkUserReguest()
    }
    
}

extension PreRegistrationPresenter: PreRegistrationInteractorOutput {
    func didReceived(model: CellModel, index: Int) {
        view?.setModel(model: model, index: index)
    }
    func didReceived(models: [CellModel]) {
        view?.setData(models: models)
    }
}
