//
//  TextCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class TextCellModel: CellModel {
    var reuseIdentifier = "TextCell"
    var headText: String
    var descriptionText: String
    var descriptionRegistration: String
    var descriptionCertificate: String
    var isExpanded: Bool
    
    init(reuseIdentifier: String, headText: String, descriptionText: String, descriptionRegistration: String, descriptionCertificate: String, isExpanded: Bool) {
        self.reuseIdentifier = reuseIdentifier
        self.headText = headText
        self.descriptionText = descriptionText
        self.descriptionRegistration = descriptionRegistration
        self.descriptionCertificate = descriptionCertificate
        self.isExpanded = isExpanded
    }
}
