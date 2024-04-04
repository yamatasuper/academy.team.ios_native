//
//  DetailCoursePresenter.swift
//  Academy
//
//  Created by MovchanArtemiy on 12.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
final class DetailCoursePresenter {
    weak var view: DetailCourseViewInput?
    var router: DetailCourseRouterInput!
    var interactor: DetailCourseInteractorInput!
    var moduleInput: DetailCourseModuleInput?
    weak var moduleOutput: DetailCourseModuleOutput?

}

extension DetailCoursePresenter : DetailCourseViewOutput {
    func tapToWebHeader(text: String, id: Int, status: Bool) {
        interactor.openWebCell(text: text, id: id, status: status)
    }
    
    func tapToDirections(id: Int, tableName: String) {
        router.goToDetailDirectionsScreen(id: id, tableName: tableName)
        //interactor.openDirection(id: id, tableName: tableName)
    }
    
    
    func tapToRegistration(registration: Bool) {
        router.goToRegistration(registration: registration)
    }
    
    
    func tapToDetail(id: Int, tableName: String) {
        router.goToDetailScreen(id: id, tableName: tableName)
    }
    
    
    func loadDetail() {
        interactor.openDetail(id: moduleInput?.id ?? 0, tableName: moduleInput?.tableName ?? "", status: false)
        
    }
    
    func tapToSlideCell(row: Int) {
          interactor.openCell(row: row)
        
    }
    
    func tapToTextCell(row: Int) {
        interactor.openTextCell(row: row)
    }
    

    func didViewLoad(_ navigation: TransitionHandlerProtocol?) {
        router.setTransitionHandler(navigation)
    }
}

extension DetailCoursePresenter: DetailCourseInteractorOutput {
    func didReceive(model: CellModel, row: Int) {
         view?.setModel(model: model, row: row)
    }

    func didReceive(models: [CellModel]) {
         view?.setData(models: models)
     }

}
