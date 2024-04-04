//
//  SummerCoursesCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class SummerCoursesCellModel: CellModel {
    var reuseIdentifier = "SummerCoursesCell"
    var nameCourse: String
    var statusCourse: String
    var isExpanded: Bool


    init(reuseIdentifier: String, nameCourse: String, statusCourse: String, isExpanded: Bool) {
        self.reuseIdentifier = reuseIdentifier
        self.nameCourse = nameCourse
        self.statusCourse = statusCourse
        self.isExpanded = isExpanded

    }
}

