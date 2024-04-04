//
//  CoursesFactory.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit

final class CoursesTableFactory {
    
    func buildCoursesList(coursesList: [CoursesList]) -> [CellModel] {
        var models = [CellModel]()
        models.append(buildFilterModel())
        for (i, coursesList) in coursesList.enumerated() {
            models.append(buildCoursesListModel(coursesList: coursesList, id: i))
            
        }
        
        return models
        
    }
    
    private func buildCoursesListModel(coursesList: CoursesList, id: Int) -> CellModel {
        return CoursesListModel(reuseIdentifier: "CoursesCell", nameCourse: coursesList.nameCourse, statusCourse: coursesList.status, tableName: coursesList.tableName, registration: coursesList.registration, rightDescription: coursesList.rightDescription, isExpanded: false, id: coursesList.id)
        
    }
    
    func buildRegistrationCoursesList(coursesList: [CoursesList]) -> [CellModel] {
         var models = [CellModel]()
         models.append(buildFilterModel())
         for (i, coursesList) in coursesList.enumerated() {
             if coursesList.registration == true {
             models.append(buildRegistrationCoursesListModel(coursesList: coursesList, id: i))
             }
             
         }
         
         return models
         
     }
     
     private func buildRegistrationCoursesListModel(coursesList: CoursesList, id: Int) -> CellModel {
        return CoursesListModel(reuseIdentifier: "CoursesCell", nameCourse: coursesList.nameCourse, statusCourse: coursesList.status, tableName: coursesList.tableName, registration: coursesList.registration, rightDescription: coursesList.rightDescription, isExpanded: false, id: coursesList.id)
         
     }
    
    
    
    func buildPreRequest() -> [CellModel] {
        var models = [CellModel]()
        models.append(buildPreRequestModel())
        
        return models
    }
    
    
    private func buildPreRequestModel() -> CellModel {
        return PreRequestCellModel(reuseIdentifier: "preRequestCell")
    }
    
    func buildFilter() -> [CellModel] {
        var models = [CellModel]()
        models.append(buildFilterModel())
        
        return models
    }
    
    private func buildFilterModel() -> CellModel {
        return FilterCellModel(reuseIdentifier: "filterCell")
    }
    
    
    
}

