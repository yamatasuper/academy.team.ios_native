//
//  DetailCourseCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class ImageCellModel: CellModel {
    var reuseIdentifier = "ImageCell"
    var headText: String
    var descriptionText: String
    var weeklyDetail: String
    var registration: Bool
    
    
    init(reuseIdentifier: String, headText: String, descriptionText: String, weeklyDetail: String, registration: Bool) {
        self.reuseIdentifier = reuseIdentifier
        self.headText = headText
        self.descriptionText = descriptionText
        self.weeklyDetail = weeklyDetail
        self.registration = registration

    }
}
