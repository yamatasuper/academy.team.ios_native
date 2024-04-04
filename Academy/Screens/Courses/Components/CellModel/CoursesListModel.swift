//
//  CoursesListModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 23.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class CoursesListModel: CellModel {
    var reuseIdentifier = "CoursesCell"
    var nameCourse: String
    var statusCourse: String
    var tableName: String
    var registration: Bool
    var rightDescription: String
    var isExpanded: Bool
    var id: Int
    
    
    init(reuseIdentifier: String, nameCourse: String, statusCourse: String, tableName: String, registration: Bool, rightDescription: String, isExpanded: Bool, id: Int) {
        self.reuseIdentifier = reuseIdentifier
        self.nameCourse = nameCourse
        self.statusCourse = statusCourse
        self.tableName = tableName
        self.registration = registration
        self.registration = registration
        self.rightDescription = rightDescription
        self.isExpanded = isExpanded
        self.id = id
    }
}
