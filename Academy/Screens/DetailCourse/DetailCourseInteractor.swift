//
//  DetailCourseInteractor.swift
//  Academy
//
//  Created by MovchanArtemiy on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit
import SQLite

final class DetailCourseInteractor {
    weak var output: DetailCourseInteractorOutput?
    let detailCourseFactory = DetailCourseFactory()

    var models: [CellModel] = []
     var lastExpandedIndex: Int = -1
    var tapStatus: Bool = false
    
    init() {
        //models = self.detailCourseFactory.build()
    }
}

extension DetailCourseInteractor: DetailCourseInteractorInput {
    
    func openWebCell(text: String, id: Int, status: Bool) {

        self.models = self.detailCourseFactory.buildDescription(text: text, id: id, status: status)
             output?.didReceive(models: models)
        
    }
        
    func openDetail(id: Int, tableName: String, status: Bool) {
        switch tableName {
        case "schedules":
            self.models = self.detailCourseFactory.buildSchedule(id: id, status: status)
            output?.didReceive(models: models)
        case "groups":
            self.models = self.detailCourseFactory.buildGroup(id: id)
            output?.didReceive(models: models)
        case "exam_preparation":
            self.models = self.detailCourseFactory.buildExam(id: id)
            output?.didReceive(models: models)
        case "directiontablename":
            self.models = self.detailCourseFactory.buildDirections(id: id)
            output?.didReceive(models: models)
        default:
            break
        }
        
    }
    
    func openDirection(id: Int, tableName: String) {
//         self.models = self.detailCourseFactory.buildDirections(id: id)
//        output?.didReceive(models: models)

    }
    
    
    
func openCell(row: Int) {
         let last = lastExpandedIndex
         lastExpandedIndex = row
         if last >= 0 && models.count > last {
             if let model = models[last] as? WebViewCellModel {
                 model.isExpanded = !model.isExpanded
                 models[last] = model
                 output?.didReceive(model: model, row: row)
             }
         }
         if models.count > lastExpandedIndex {
             if let model = models[lastExpandedIndex] as? WebViewCellModel {
                 model.isExpanded = !model.isExpanded
                 models[lastExpandedIndex] = model
                 output?.didReceive(model: model, row: row)
             }
         }
     }
    
    func openTextCell(row: Int) {
        let last = lastExpandedIndex
        lastExpandedIndex = row
        if last >= 0 && models.count > last {
            if let model = models[last] as? TextCellModel {
                model.isExpanded = !model.isExpanded
                models[last] = model
                output?.didReceive(model: model, row: row)
            }
        }
        if models.count > lastExpandedIndex {
            if let model = models[lastExpandedIndex] as? TextCellModel {
                model.isExpanded = !model.isExpanded
                models[lastExpandedIndex] = model
                output?.didReceive(model: model, row: row)
            }
        }
    }
    
    func didObtainModels() {
//        self.models = self.detailCourseFactory.build()
//        output?.didReceive(models: models)
    }
    
}
