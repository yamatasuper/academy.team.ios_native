//
//  CourseCollectionModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class CourseCollectionModel: CollectionCellModel {
    let reuseIdentifier = "CourseCollectionCell"
    var item: MyCoursesList
    
    init(item: MyCoursesList) {
        self.item = item
    }
}
