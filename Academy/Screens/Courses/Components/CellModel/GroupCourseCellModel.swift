//
//  GroupCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 22.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class GroupCourseCellModel: CellModel {
    var reuseIdentifier = "GroupCoursesCell"
    var nameCourse: String
    var statusCourse: String
    var sorting: Int
//    var leftDescription: String
//    var rightDescription: String
//    var program: String
//    var whenCourse: String
    //var isExpanded: Bool
    var id: Int
    
//    init(reuseIdentifier: String, nameCourse: String, statusCourse: String, leftDescription: String, rightDescription: String, program: String, whenCourse: String, isExpanded: Bool, id: Int) {
//        self.reuseIdentifier = reuseIdentifier
//        self.nameCourse = nameCourse
//        self.statusCourse = statusCourse
//        self.leftDescription = leftDescription
//        self.rightDescription = rightDescription
//        self.program = program
//        self.whenCourse = whenCourse
//        self.isExpanded = isExpanded
//        self.id = id
//    }
    
    init(reuseIdentifier: String, nameCourse: String, statusCourse: String, sorting: Int,  id: Int) {
        self.reuseIdentifier = reuseIdentifier
        self.nameCourse = nameCourse
        self.statusCourse = statusCourse
        self.sorting = sorting
        //self.isExpanded = isExpanded
        self.id = id
    }
}
