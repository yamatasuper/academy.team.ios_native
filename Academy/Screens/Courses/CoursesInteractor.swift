//
//  CoursesInteractor.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

final class CoursesInteractor {
    weak var output: CoursesInteractorOutput?
    let aboutViewTableFactory = CoursesTableFactory()
    
    var models: [CellModel] = []
    
    lazy var data: [Schedules] = []
    lazy var groupArray: [Groups] = []
    lazy var exam_prepare: [Exam_preparation] = []
    lazy var coursesList: [CoursesList] = []
    
    var lastExpandedIndex: Int = -1
    
    
    init() {
    }
    
}

extension CoursesInteractor: CoursesInteractorInput {
    var getScreenTitle: String {
        get {
            return "Наши курсы"
        }
    }
    
    func didLoadFilterModels(filter: Bool) {
        if Reachability().isConnectedToNetwork() == true {
            GetCoursesListCase.init().background { (ui, executor) in
                let response = executor()
                ui.post {
                    let statusCode:Int = response.statusCode
                    switch statusCode {
                    case 200:
                        if let coursesList = response.result {
                            
                            self.coursesList = coursesList
                            
                            if filter == true {
                                var models:[CellModel] =  self.aboutViewTableFactory.buildRegistrationCoursesList(coursesList: coursesList)
                                self.output?.didReceive(models: models)
                                
                            } else {
                                var models:[CellModel] =  self.aboutViewTableFactory.buildCoursesList(coursesList: coursesList)
                                self.output?.didReceive(models: models)
                            }
                            
                        }
                        
                        break
                    default:
                        
                        break
                    }
                    
                }
            }
        } else {
            print("--> No internet connection")
        }
    }
    
    func openCell(row: Int) {
        let last = lastExpandedIndex
        lastExpandedIndex = row
        if last >= 0 && models.count > last {
            if let model = models[last] as? CoursesListModel {
                model.isExpanded = !model.isExpanded
                models[last] = model
                output?.didReceive(model: model, row: row)
            }
        }
        if models.count > lastExpandedIndex {
            if let model = models[lastExpandedIndex] as? CoursesListModel {
                model.isExpanded = !model.isExpanded
                models[lastExpandedIndex] = model
                output?.didReceive(model: model, row: row)
            }
        }
        
        
    }
    
    
    func didObtainModels() {
        if Reachability().isConnectedToNetwork() == true {
            GetCoursesListCase.init().background { (ui, executor) in
                let response = executor()
                ui.post {
                    let statusCode:Int = response.statusCode
                    switch statusCode {
                    case 200:
                        if let coursesList = response.result {
                                           
                            self.coursesList = coursesList
                            
                            var models:[CellModel] =  self.aboutViewTableFactory.buildCoursesList(coursesList: coursesList)
                            self.output?.didReceive(models: models)
                        }
                        
                        break
                    default:
                        
                        break
                    }
                    
                }
            }
        } else {
            print("--> No internet connection")
        }

    }
    
}
