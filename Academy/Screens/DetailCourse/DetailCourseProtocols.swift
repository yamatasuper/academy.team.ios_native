//
//  DetailCourseProtocols.swift
//  Academy
//
//  Created by MovchanArtemiy on 12.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

// Входные параметры модуля
protocol DetailCourseModuleInput {
    
    var moduleOutput: DetailCourseModuleOutput? { get }
    var id: Int { get }
    var tableName: String { get }
}

// Выходные данные (и делегаты) модуля
protocol DetailCourseModuleOutput: AnyObject {
    
}

// Управление View от Presenter`ом
protocol DetailCourseViewInput: AnyObject {
    func setData(models: [CellModel])
    func setModel(model: CellModel, row: Int)
}

// Передача событий от View к Presenter`у
protocol DetailCourseViewOutput: AnyObject {
    func didViewLoad(_ navigation: TransitionHandlerProtocol?)
    func tapToSlideCell(row: Int)
    func tapToTextCell(row: Int)
    func loadDetail()
    func tapToDetail(id: Int, tableName: String)
    func tapToRegistration(registration: Bool)
    func tapToDirections(id: Int, tableName: String)
    func tapToWebHeader(text: String, id: Int, status: Bool)
    
}

// Управление Presenter от Interactor`ом
protocol DetailCourseInteractorInput: AnyObject {
    func openCell(row: Int)
    func openTextCell(row: Int)
    func didObtainModels()
    func openDetail(id: Int, tableName: String, status: Bool)
    func openDirection(id: Int, tableName: String)
    func openWebCell(text: String, id: Int, status: Bool)
}

// Передача данных от Interactor к Presenter`у
protocol DetailCourseInteractorOutput: AnyObject {
    func didReceive(model: CellModel, row: Int)
    func didReceive(models: [CellModel])
}

// Навигация / межмодульное взаимодействие
protocol DetailCourseRouterInput: AnyObject {
    func setTransitionHandler(_ transitionHandler: TransitionHandlerProtocol?)
    func goToDetailScreen(id: Int, tableName: String)
    func goToRegistration(registration: Bool)
    func goToDetailDirectionsScreen(id: Int, tableName: String)
}
