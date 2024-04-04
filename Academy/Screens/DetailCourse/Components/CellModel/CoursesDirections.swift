//
//  CoursesDirections.swift
//  Academy
//
//  Created by MovchanArtemiy on 06.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation


class CoursesDirections: CellModel {
    var reuseIdentifier = "CoursesCell"
    var nameCourse: String
    var statusCourse: String
    var sorting: Int
    var id: Int
    

    init(reuseIdentifier: String, nameCourse: String, statusCourse: String, sorting: Int, id: Int) {
        self.reuseIdentifier = reuseIdentifier
        self.nameCourse = nameCourse
        self.statusCourse = statusCourse
        self.sorting = sorting
        self.id = id
    }
}
