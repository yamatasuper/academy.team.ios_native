//
//  CourseCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class CourseCellModel: CellModel {
    var reuseIdentifier = "CoursesCell"
    var nameCourse: String
    var statusCourse: String
    var sorting: Int
    var isExpanded: Bool
    var id: Int
    
    init(reuseIdentifier: String, nameCourse: String, statusCourse: String, sorting: Int,  isExpanded: Bool, id: Int) {
        self.reuseIdentifier = reuseIdentifier
        self.nameCourse = nameCourse
        self.statusCourse = statusCourse
        self.sorting = sorting
        self.isExpanded = isExpanded
        self.id = id
    }
}
