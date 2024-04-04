//
//  PreRegistrationProtocols.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

// Входные параметры модуля
protocol PreRegistrationModuleInput {
    var moduleOutput: PreRegistrationModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
protocol PreRegistrationModuleOutput: AnyObject {
}

// Управление View от Presenter`ом
protocol PreRegistrationViewInput: AnyObject {
    func setData(models: [CellModel])
    func setModel(model: CellModel, index: Int)
    
}

// Передача событий от View к Presenter`у
protocol PreRegistrationViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func saveEmailFieldText(email: String)
    func saveNameFieldText(userName: String)
    func saveUniversityFieldText(universityName: String)
    func saveScheduleText(schedule: String)
    func goValidateEmail()
    
}

// Управление Presenter от Interactor`ом
protocol PreRegistrationInteractorInput: AnyObject {
    func configureModels()
    func setEmail(email: String)
    func setUserName(userName: String)
    func setUniversityName(universityName: String)
    func setScheduleName(schedule: String)
    func loadListCourses()
    func checkUserReguest()
    
}

// Передача данных от Interactor к Presenter`у
protocol PreRegistrationInteractorOutput: AnyObject {
    func didReceived(models: [CellModel])
    func didReceived(model: CellModel, index: Int)
}

// Навигация / межмодульное взаимодействие
protocol PreRegistrationRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
}
