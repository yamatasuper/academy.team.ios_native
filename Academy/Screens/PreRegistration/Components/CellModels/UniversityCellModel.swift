//
//  UniversityCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class UniversityCellModel: CellModel {
    var reuseIdentifier = "universityCell"
    var universityName = ""
    
    init(reuseIdentifier: String) {
        self.reuseIdentifier = reuseIdentifier
    }
}
