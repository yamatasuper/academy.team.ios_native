//
//  CoursesPresenter.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class CoursesPresenter {
    weak var view: CoursesViewInput?
    var router: CoursesRouterInput!
    var interactor: CoursesInteractorInput!
    var moduleInput: CoursesModuleInput?
    weak var moduleOutput: CoursesModuleOutput?
    
}

extension CoursesPresenter : CoursesViewOutput {
    func tapToDirections(id: Int) {
        
    }
    
    func tapToFilter(filter: Bool) {
        interactor.didLoadFilterModels(filter: filter)
    }
    
    func tapToDetail(id: Int, tableName: String) {
        router.goToDetailScreen(id: id, tableName: tableName)
    }
    
    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        router.setTransitionHandler(navigation)
        view?.setScreenTitle(with: interactor.getScreenTitle)
        interactor.didObtainModels()
    }
    
    func tapToPreliminary() {
        router.goToPreliminary()
        
    }

    func tapToSlideCell(row: Int) {
        interactor.openCell(row: row)
    }
    
    
}

extension CoursesPresenter: CoursesInteractorOutput {
    func didReceive(model: CellModel, row: Int) {
        view?.setModel(model: model, row: row)
    }
    
    func didReceive(models: [CellModel]) {
        view?.setData(models: models)
    }
    
}
