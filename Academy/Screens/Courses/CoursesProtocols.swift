//
//  CoursesProtocols.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

// Входные параметры модуля
 protocol CoursesModuleInput {
    var moduleOutput: CoursesModuleOutput? { get }
}

// Выходные данные (и делегаты) модуля
 protocol CoursesModuleOutput: AnyObject {
    
}

// Управление View от Presenter`ом
protocol CoursesViewInput: AnyObject {
    func setData(models: [CellModel])
    func setModel(model: CellModel, row: Int)
    func setScreenTitle(with title: String)
}

// Передача событий от View к Presenter`у
protocol CoursesViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func tapToSlideCell(row: Int)
    func tapToDetail(id: Int, tableName: String)
    func tapToFilter(filter: Bool)
    func tapToPreliminary()
}

// Управление Presenter от Interactor`ом
protocol CoursesInteractorInput: AnyObject {
    var getScreenTitle: String { get }
    func openCell(row: Int)
    func didObtainModels()
    func didLoadFilterModels(filter: Bool)
}

// Передача данных от Interactor к Presenter`у
protocol CoursesInteractorOutput: AnyObject {
    func didReceive(model: CellModel, row: Int)
    func didReceive(models: [CellModel])
}

// Навигация / межмодульное взаимодействие
protocol CoursesRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
    func goToDetailScreen(id: Int, tableName: String)
    func goToPreliminary()
}
