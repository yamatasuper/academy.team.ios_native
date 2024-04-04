//
//  CollectionListModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class CollectionListModel: CellModel {
    let reuseIdentifier = "CollectionListCell"
    var list: [MyCoursesList]?
    
    init(list: [MyCoursesList]) {
        self.list = list
    }
}
